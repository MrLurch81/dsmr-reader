from django.utils.translation import gettext_lazy as _
from django.db import models

from dsmr_backend.mixins import ModelUpdateMixin


class Message(ModelUpdateMixin, models.Model):
    """Queued message for MQTT."""

    topic = models.CharField(max_length=255)
    payload = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.topic

    class Meta:
        default_permissions = ("delete",)  # Do allow deletion.
        verbose_name = _("Outgoing MQTT message")
        verbose_name_plural = _("Outgoing MQTT messages")
