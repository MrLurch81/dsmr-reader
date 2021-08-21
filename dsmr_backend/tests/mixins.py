from io import StringIO

from django.core.management import call_command


class InterceptCommandStdoutMixin:
    """ Suppresses stdout for tests. Returns stdout. """
    def _intercept_command_stdout(self, command: str, *args, **kwargs) -> str:
        stdout = StringIO()
        stderr = StringIO()  # Only for muting.
        call_command(command, stdout=stdout, stderr=stderr, *args, **kwargs)
        stdout.seek(0)
        return stdout.read()
