from django.test import TestCase
from django.contrib.admin.sites import site

from dsmr_datalogger.models.settings import DataloggerSettings, RetentionSettings


class TestDataloggerSettings(TestCase):
    """Tests for settings defaults."""

    def setUp(self):
        self.instance = DataloggerSettings().get_solo()

    def test_admin(self):
        """Model should be registered in Django Admin."""
        self.assertTrue(site.is_registered(DataloggerSettings))

    def test_to_string(self):
        self.assertNotEqual(
            str(self.instance), "{} object".format(self.instance.__class__.__name__)
        )

    def test_dsmr_version(self):
        self.assertEqual(
            self.instance.dsmr_version, DataloggerSettings.DSMR_VERSION_4_PLUS
        )

    def test_com_port(self):
        self.assertEqual(self.instance.serial_port, "/dev/ttyUSB0")


class TestRetentionSettings(TestCase):
    """Tests for settings defaults."""

    def setUp(self):
        self.instance = RetentionSettings().get_solo()

    def test_admin(self):
        """Model should be registered in Django Admin."""
        self.assertTrue(site.is_registered(RetentionSettings))

    def test_to_string(self):
        self.assertNotEqual(
            str(self.instance), "{} object".format(self.instance.__class__.__name__)
        )

    def test_data_retention_in_hours(self):
        self.assertEqual(
            self.instance.data_retention_in_hours, RetentionSettings.RETENTION_MONTH
        )
