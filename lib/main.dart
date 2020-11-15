import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heaven_canceller_hospital/models/patient.dart';
import 'package:hive/hive.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:heaven_canceller_hospital/shared/shared.dart';
import 'package:heaven_canceller_hospital/ui/ui.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter<Patient>(PatientAdapter());
  await Hive.openBox<Patient>("patients");
  await Firebase.initializeApp();

  OneSignal.shared.init(oneSignalAppID, iOSSettings: null);
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

  runApp(MyApp());
}

///* MyApp Class - Root Of Project

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProvider,
      child: MaterialApp(
        title: "Heaven Canceller Hospital",
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routes: appRoute,
        home: Wrapper(),
      ),
    );
  }
}
