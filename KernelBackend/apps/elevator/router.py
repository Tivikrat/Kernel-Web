from rest_framework.routers import DefaultRouter

from apps.elevator import views

router = DefaultRouter()
router.register('goods', views.GoodViewSet)
router.register('elevators', views.ElevatorViewSet)
router.register('elevators_search/(?P<name>.*)', views.ElevatorSearchViewSet, 'elevators-search')
router.register('labs', views.LabAssistantViewSet)
router.register('weighings', views.WeighingViewSet)
router.register('guardians', views.GuardianViewSet)
router.register('providers', views.ProviderViewSet)
router.register('providers_search/(?P<name>.*)', views.ProviderSearchViewSet, 'providers-search')
router.register('weighing_lsds', views.WeighingLSDViewSet, 'weighing_lsds')
router.register('weight_checks', views.WeightCheckLSDViewSet, 'weight_checks')
router.register('lab_analysis', views.LabAnalysisViewSet, 'lab_analysis')