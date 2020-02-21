import mimetypes
import os
import urllib

from django.http import HttpResponse
from openpyxl import load_workbook
from rest_framework import viewsets, status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from apps.auth.serializers import is_superuser
from apps.elevator import models, serializers
from apps.elevator.models import Delivery


class GoodViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.GoodSerializer
    queryset = models.Good.objects.all()


class ElevatorViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.ElevatorSerializer
    queryset = models.Elevator.objects.all()


class ElevatorSearchViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.ElevatorSerializer

    def get_queryset(self):
        return models.Elevator.objects.filter(name__icontains=self.kwargs['name'])


class LabAssistantViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.LabAssistantSerializer
    queryset = models.LabAssistant.objects.all()


class WeighingViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.WeighingSerializer
    queryset = models.Weighing.objects.all()


class GuardianViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.GuardianSerializer
    queryset = models.Guardian.objects.all()


class ProviderViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.ProviderSerializer
    queryset = models.Provider.objects.all()


class ProviderSearchViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.ProviderSerializer

    def get_queryset(self):
        return models.Provider.objects.filter(name__icontains=self.kwargs['name'])


class StaffDeliveryViewSet(viewsets.ModelViewSet):
    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            return models.Delivery.objects.all()
        elif user.is_authenticated:
            return (models.Delivery.objects.filter(elevator__labassistant__user=user)
                    | models.Delivery.objects.filter(elevator__weighing__user=user)
                    | models.Delivery.objects.filter(elevator__guardian__user=user))
        else:
            return models.Delivery.objects.none()


class WeighingDeliveryViewSet(StaffDeliveryViewSet):
    serializer_class = serializers.WeighingDeliverySerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            return models.Delivery.objects.all()
        elif user.is_authenticated:
            return models.Delivery.objects.filter(elevator__weighing__user=user)
        else:
            return models.Delivery.objects.none()


class WeightCheckDeliveryViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.WeightCheckDeliverySerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            return models.Delivery.objects.all()
        elif user.is_authenticated:
            return models.Delivery.objects.filter(elevator__weighing__user=user, weight_check=None)
        else:
            return models.Delivery.objects.none()

    def destroy(self, request, *args, **kwargs):
        lsd_instance = self.get_object()
        instance = models.WeightCheck.objects.filter(id=lsd_instance.weight_check.id)
        user = self.request.user
        if user.is_superuser or models.Weighing.objects.filter(user=user).exists():
            instance.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'non_field_errors': "Forbidden"})


class LabAnalysisViewSet(StaffDeliveryViewSet):
    serializer_class = serializers.LabAnalysisDeliverySerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            return models.Delivery.objects.all()
        elif user.is_authenticated:
            return models.Delivery.objects.filter(elevator__labassistant__user=user, lab_analysis=None)
        else:
            return models.Delivery.objects.none()

    def destroy(self, request, *args, **kwargs):
        lsd_instance = self.get_object()
        instance = models.LabAnalysis.objects.filter(id=lsd_instance.lab_analysis.id)
        user = self.request.user
        if user.is_superuser or models.LabAssistant.objects.filter(user=user).exists():
            instance.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'non_field_errors': "Forbidden"})


class GuardianDeliveryViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.GuardianDeliverySerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_authenticated:
            queryset = models.GuardianDelivery.objects.filter(elevator__guardian__user=user)
        else:
            queryset = models.GuardianDelivery.objects.none()
        return queryset


class AdminWeighingDeliveryViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.WeighingDeliverySerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            queryset = models.Delivery.objects.exclude(
                name__in=models.GuardianDelivery.objects.values_list('name', flat=True))
        else:
            queryset = models.Delivery.objects.none()
        return queryset


class AdminGuardianDeliveryViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.AdminGuardianDeliverySerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_superuser:
            queryset = models.GuardianDelivery.objects.exclude(
                name__in=models.Delivery.objects.values_list('name', flat=True))
        else:
            queryset = models.GuardianDelivery.objects.none()
        return queryset


def process_day(sheet, current_date, index, delivery, humidity, clogging, weight):
    sheet['A' + str(index)].value = current_date
    sheet['B' + str(index)].value = "ЭЛ20-" + str(current_date.year)[:2] + str(current_date.month) + str(
        current_date.day)
    sheet['C' + str(index)].value = delivery.provider.name
    sheet['D' + str(index)].value = round(humidity / weight, 2) if weight > 0 else ""
    sheet['E' + str(index)].value = round(clogging / weight, 2) if weight > 0 else ""
    sheet['F' + str(index)].value = weight
    sheet['G' + str(index)].value = "=F" + str(index) + "*" + "D" + str(index) + "/100"
    sheet['H' + str(index)].value = "=F" + str(index) + "*" + "E" + str(index) + "/100"


def process_month(sheet, index, current_date, month_index):
    sheet[f'A{index}'].value = current_date
    sheet[f'C{index}'].value = 'акт очистки - сушки'
    sheet[f'D{index}'].value = 14
    sheet[f'E{index}'].value = 2
    sheet[f'I{index}'].value = f"=O{index}*F{index + 2}/100"
    sheet[f'J{index}'].value = f"=I{index}*D{index}/100"
    sheet[f'K{index}'].value = f"=I{index}*E{index}/100"
    sheet[f'M{index}'].value = f"=F{index + 2}*N{index}/100"
    sheet[f'N{index}'].value = f"=100*(D{index + 2}-14)/(100-14)"
    sheet[f'O{index}'].value = f"=(100-N{index})*(E{index + 2}-2)/(100-2)"
    sheet[f'A{index + 1}'].value = current_date
    sheet[f'C{index + 1}'].value = 'акт сушки'
    sheet[f'D{index + 1}'].value = 14
    sheet[f'E{index + 1}'].value = 2
    sheet[f'C{index + 2}'].value = "Загальне надходження за місяць"
    sheet[f'D{index + 2}'].value = f"=G{index + 2}*100/F{index + 2}"
    sheet[f'E{index + 2}'].value = f"=H{index + 2}*100/F{index + 2}"
    sheet[f'F{index + 2}'].value = f"=SUM(F{month_index}:F{index - 1})"
    sheet[f'G{index + 2}'].value = f"=SUM(G{month_index}:G{index - 1})"
    sheet[f'H{index + 2}'].value = f"=SUM(H{month_index}:H{index - 1})"
    sheet[f'C{index + 3}'].value = "Загальне відвантаження за місяць"
    sheet[f'D{index + 3}'].value = 14
    sheet[f'E{index + 3}'].value = 2
    sheet[f'I{index + 3}'].value = f'=SUM(I{month_index}:I{index + 1})'
    sheet[f'J{index + 3}'].value = f'=SUM(J{month_index}:J{index + 1})'
    sheet[f'K{index + 3}'].value = f'=SUM(K{month_index}:K{index + 1})'
    if month_index == 5:
        sheet[f'L{index + 3}'].value = f'=F{index + 2}-I{index + 3}'
    else:
        sheet[f'L{index + 3}'].value = f'=F{index + 2}-I{index + 3}+L{month_index - 1}'
    sheet[f'M{index + 3}'].value = f'=SUM(M{month_index}:M{index + 1})'


@api_view(['GET'])
def motion_report(request):
    wb = load_workbook('report.xlsx')
    sheet = wb.get_sheet_by_name(wb.get_sheet_names()[0])
    if request.user.is_superuser:
        deliveries_by_dates = Delivery.objects.all().order_by('date')
    elif request.user.is_authenticated:
        deliveries_by_dates = Delivery.objects.filter(provider__user=request.user).order_by('date')
    else:
        deliveries_by_dates = Delivery.objects.none()
    index = 5
    month_index = 5
    months_indexes = []
    if deliveries_by_dates.exists():
        current_date = deliveries_by_dates.first().date

        weight = 0
        humidity = 0
        clogging = 0
        for delivery in deliveries_by_dates.all():
            if delivery.weight_check is not None and delivery.lab_analysis is not None:
                if current_date.year != delivery.date.year or current_date.month != delivery.date.month or current_date.day != delivery.date.day:
                    process_day(sheet, current_date, index, delivery, humidity, clogging, weight)
                    weight = 0
                    humidity = 0
                    clogging = 0
                    index += 1
                    if current_date.year != delivery.date.year or current_date.month != delivery.date.month:
                        process_month(sheet, index, current_date, month_index)
                        index += 4
                        month_index = index
                        months_indexes += [month_index]
                    current_date = delivery.date
                weight += delivery.weight_check.net_weight
                humidity += delivery.lab_analysis.humidity * delivery.weight_check.net_weight
                clogging += delivery.lab_analysis.clogging * delivery.weight_check.net_weight
        process_day(sheet, current_date, index, deliveries_by_dates.first(), humidity, clogging, weight)
        weight = 0
        humidity = 0
        clogging = 0
        index += 1
        process_month(sheet, index, current_date, month_index)
        index += 4
        month_index = index
        months_indexes += [month_index]
        sheet[f'C{index}'].value = "Загальне надходження"
        sheet[f'D{index}'].value = f"=G{index}*100/F{index}"
        sheet[f'E{index}'].value = f"=H{index}*100/F{index}"
        sheet[f'F{index}'].value = f"={'+'.join([f'F{i - 2}' for i in months_indexes])}"
        sheet[f'G{index}'].value = f"={'+'.join([f'G{i - 2}' for i in months_indexes])}"
        sheet[f'H{index}'].value = f"={'+'.join([f'H{i - 2}' for i in months_indexes])}"
        sheet[f'C{index + 1}'].value = "Загальне відвантаження"
        sheet[f'D{index + 1}'].value = 14
        sheet[f'E{index + 1}'].value = 2
        sheet[f'I{index + 1}'].value = f"={'+'.join([f'I{i - 1}' for i in months_indexes])}"
        sheet[f'J{index + 1}'].value = f"={'+'.join([f'J{i - 1}' for i in months_indexes])}"
        sheet[f'K{index + 1}'].value = f"={'+'.join([f'K{i - 1}' for i in months_indexes])}"
        sheet[f'L{index + 1}'].value = f"=L{index - 1}"
        sheet[f'M{index + 1}'].value = f"={'+'.join([f'M{i - 1}' for i in months_indexes])}"
    path = f'upload/{request.user.username}_report.xlsx'
    wb.save(path)
    with open(path, 'rb') as bf:
        mime_type = mimetypes.guess_type(bf.name)

        response = HttpResponse(bf.read(), content_type=mime_type[0])
        response['Content-Disposition'] = \
            "attachment; filename*=UTF-8''" + urllib.parse.quote(os.path.basename(path), safe='')

        return response
