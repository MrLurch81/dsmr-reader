from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ApiAppConfig(AppConfig):
    name = "dsmr_api"
    verbose_name = _("API")
