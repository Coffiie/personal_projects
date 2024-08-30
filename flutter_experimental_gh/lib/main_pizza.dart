import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import 'flavors.dart';
import 'main.dart' as runner;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //YOU CAN CREATE CONFIGURATIONS BASED ON FLAVORS
  Mixpanel.init(
    F.mixpanelKey,
    trackAutomaticEvents: true,
  );
  DdSdkConfiguration(
    clientToken: F.datadogClientToken,
    env: F.title,
    trackingConsent: TrackingConsent.granted,
    site: DatadogSite.eu1,
  );
  await CleverTapPlugin.createNotificationChannel(
    F.title,
    'notificationChannel',
    F.name,
    3,
    true,
  );
  //YOU CAN CREATE YOUR OWN FIREBASE FILES AS SHOWN IN THE VIDEO
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  F.appFlavor = Flavor.pizza;
  await runner.main();
}
