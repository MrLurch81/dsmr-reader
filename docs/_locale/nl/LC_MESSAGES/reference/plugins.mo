��    .      �              �  9   �  �   7  �   �  �   R  {   �  �   i  p     ~   y     �            2      ?   S  C   �  ?   �  1     	   I  w   S  i   �  l   5	  q   �	  X   
     m
  %   s
  T   �
  P   �
  S   ?  J   �  N   �     -  Z   5  U   �  n   �  �   U  �   �  F   �  �   �  W   b  &   �  '   �  (   	  /   2  )   b  `   �  ;   �  �  )  8     �   ?  �   �  �   _  �     �   �  �   _  �   �     �     �     �  >   �  R   �  i   L  G   �  6   �     5  �   B  m   �  k   _  l   �  `   8     �  !   �  \   �  X      [   y  R   �  V   (       Z   �  O   �  �   2  �   �  �   k  X   #   �   |   p   !  &   r!  '   �!  (   �!  /   �!  )   "  f   D"  E   �"   :doc:`DSMRREADER_PLUGINS configuration<./env-settings>`:: Add the **dotted** path as ``DSMRREADER_PLUGINS`` env var. For more information :doc:`see DSMRREADER_PLUGINS in Env Settings<./env-settings>`. And finally, make sure to **restart the application** to reflect the changes. Do so by executing the following as **root user or sudoer**:: Called by Django after saving new records to the database. Can be bound to the ``DayStatistics`` model for example, to process daily statistics elsewhere. Called by dsmr_datalogger when receiving or reading a telegram string. The ``data`` kwarg contains the raw telegram string. Called by dsmr_notification just after dispatching a notification. The ``title`` kwarg contains the notification title, ``message`` contains the message body. Called by dsmr_pvoutput just before uploading data to PVOutput. The ``data`` kwarg contains the data to be sent. Called by each iteration of the backend. Please use with caution, as it may block all backend operations when used improperly. Configuration Contents Events / Signals Example #1: Upload data to second PVOutput account Example #2: Forwarding raw telegram data to another serial port Example #3: Forwarding raw telegram data to another instance by API Example #4: Forwarding DSMR readings in JSON format to some API Example #5: Read telegrams using DSMRloggerWS API Examples: More signals may be available for use, please be careful when binding Django save-signals as it may impact performance. Note that the ``/dev/ttyUSBvA`` variable should be changed to the serial port used in your own situation. Note that the ``API_HOST``, ``API_KEY`` and ``TIMEOUT`` variables should be changed to your own preferences. Note that the ``XXXXX`` and ``YYYYY`` variables should be replace by your second set of PVOutput API credentials. Note that you might need to update the ``http://localhost`` value to your own situation. Other Please make sure the ``plugin_name``, Plugin file ``dsmr_plugins/modules/forward_json_dsmrreading_to_api.py`` (new file):: Plugin file ``dsmr_plugins/modules/forward_raw_telegram_to_api.py`` (new file):: Plugin file ``dsmr_plugins/modules/forward_raw_telegram_to_serial.py`` (new file):: Plugin file ``dsmr_plugins/modules/poll_dsmrloggerws_api.py`` (new file):: Plugin file ``dsmr_plugins/modules/secondary_pvoutput_upload.py`` (new file):: Plugins The application allows you to create and add plugins, hooking on certain events triggered. These are either dispatched by the Django framework or the application at some point. This can be quite handy if you run multiple instances of DSMR-reader (i.e.: RaspberryPI + somewhere in cloud). This is an example of issue `#407 <https://github.com/dsmrreader/dsmr-reader/issues/407>`_, requesting the feature to upload data to a second PVOuput account. This is an example of issue `#557 <https://github.com/dsmrreader/dsmr-reader/issues/557>`_, allowing raw DSMR telegrams to be forwarded to another serial port. Use this to send DSMR readings in JSON format to some (arbitrary) API. You can create plugins in their own file in ``dsmr_plugins/modules/plugin_name.py``, where ``plugin_name`` is the name of your plugin. Your plugin file is imported once, so you should make sure to hook any events you want. ``django.db.models.signals.post_save`` ``dsmr_backend.signals.backend_called`` ``dsmr_datalogger.signals.raw_telegram`` ``dsmr_notification.signals.notification_sent`` ``dsmr_pvoutput.signals.pvoutput_upload`` does not contains spaces or dashes, only use underscores and do not start the name with a digit. is lowercase (``plugin_name`` and **not** ``PLUGIN_NAME``), Project-Id-Version:  DSMR-reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
POT-Creation-Date: 2024-03-05 20:59+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.14.0
 :doc:`DSMRREADER_PLUGINS configuratie<./env-settings>`:: Voeg het **dotted** pad in als ``DSMRREADER_PLUGINS`` env var. Voor meer informatie, :doc:`zie DSMRREADER_PLUGINS in Env-instellingen<./env-settings>`. Tot slot, zorg ervoor dat je **de applicatie herstart** om de wijzigingen door te voeren. Voer als **root of sudo-gebruiker** dit uit:: Aangeroepen door Django bij het opslaan van nieuwe databaserecords. Kan gekoppeld worden aan bijvoorbeeld het ``DayStatistics`` model, om dagelijkse statistieken ergens anders te verwerken. Aangeroepen door dsmr_datalogger wanneer er een telegram ontvangen of uitgelezen wordt. De ``data`` kwarg bevat de ruwe string met het telegram. Aangeroepen door dsmr_notification vlak nadat een notificatie verstuurd wordt. De ``title`` kwarg bevat de titel van de notificatie, ``message`` bevat het inhoudelijke bericht. Aangeroepen door dsmr_pvoutput vlak voor het uploaden van gegevens naar PVOutput. De ``data`` kwarg bevat de gegevens die verstuurd worden. Aangeroepen bij elke iteratie van de backend. Gebruik dit terughoudend, gezien het alle backend-acties kan blokkeren wanneer het verkeerd gebruikt wordt. Configuratie Inhoudsopgave Gebeurtenissen / Signalen Voorbeeld #1: Upload gegevens naar een tweede PVOutput-account Voorbeeld #2: Doorsturen van ruwe telegram-gegevens naar een andere seriële poort Voorbeeld #3: Doorsturen van ruwe telegram-gegevens naar een andere instantie van DSMR-reader, via de API Voorbeeld #4: Doorsturen van DSMR-metingen in JSON-formaat naar een API Voorbeeld #5: Lees telegrammen uit de DSMRloggerWS API Voorbeelden: Meer signalen/gebeurtenissen zijn beschikbaar voor gebruik, echter wees voorzichtig bij het gebruiken van Django save-signalen, aangezien het de performance kan beïnvloeden. N.B.: Je moet de ``/dev/ttyUSBvA`` variabele nog wijzigen naar de juiste seriële poort in je eigen situatie. N.B.: De ``API_HOST``, ``API_KEY`` en ``TIMEOUT`` variabelen moet je nog wijzigen naar je eigen voorkeuren. N.B.: De variablen ``XXXXX`` en ``YYYYY`` vervang je door de API-credentials van je tweede PVOutput-account. Let op dat je mogelijk de waarde van ``http://localhost`` moet bijwerken naar je eigen situatie. Overige Zorg er voor dat ``plugin_naam``, Plugin bestand ``dsmr_plugins/modules/forward_json_dsmrreading_to_api.py`` (nieuw bestand):: Plugin bestand ``dsmr_plugins/modules/forward_raw_telegram_to_api.py`` (nieuw bestand):: Plugin bestand ``dsmr_plugins/modules/forward_raw_telegram_to_serial.py`` (nieuw bestand):: Plugin bestand ``dsmr_plugins/modules/poll_dsmrloggerws_api.py`` (nieuw bestand):: Plugin bestand ``dsmr_plugins/modules/secondary_pvoutput_upload.py`` (nieuw bestand):: Plugins De applicatie staat je toe om plugins te maken en te koppelen, op bepaalde gebeurtenissen. Deze worden verstuurd door ofwel het Django framework ofwel de applicatie zelf. Dit kan behoorlijk handig zijn wanneer je meerdere instanties van DSMR-reader draait (bijvoorbeeld op een Raspberry en gespiegeld in de cloud). Dit is een voorbeeld van issue `#407 <https://github.com/dsmrreader/dsmr-reader/issues/407>`_, met het verzoek om gegevens te uploaden naar een tweede PVOutput-account. Dit is een voorbeeld van issue `#557 <https://github.com/dsmrreader/dsmr-reader/issues/557>`_, wat ervoor zorgt dat je DSMR-telegrammen kunt doorsturen naar een andere seriële poort. Gebruik dit om DSMR-metingen in JSON-formaat naar een (willekeurige) API door te sturen. Je kan plugins maken in hun eigen bestand in ``dsmr_plugins/modules/plugin_naam.py``, waar ``plugin_naam`` de naam van je plugin is. Je plugin-bestand wordt eenmalig geimporteerd, dus zorg ervoor dat je gebeurtenissen koppelt die je wilt volgen. ``django.db.models.signals.post_save`` ``dsmr_backend.signals.backend_called`` ``dsmr_datalogger.signals.raw_telegram`` ``dsmr_notification.signals.notification_sent`` ``dsmr_pvoutput.signals.pvoutput_upload`` geen spaties of koppeltekens bevat, gebruik daarvoor underscores en begin de naam niet met een cijfer. zonder hoofdletters is (``plugin_naam`` en **niet** ``PLUGIN_NAAM``), 