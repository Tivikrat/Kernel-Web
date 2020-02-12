from rest_framework.routers import DefaultRouter
from apps.auth import views

router = DefaultRouter()
router.register('login', views.LoginViewSet)
router.register('current', views.CurrentUserViewSet, 'current_user')
router.register(r'users', views.UserViewSet, 'users')
router.register(r'users_search/(?P<username>.*)', views.UserSearchViewSet, 'users')
