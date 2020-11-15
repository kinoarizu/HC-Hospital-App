import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heaven_canceller_hospital/models/patient.dart';
import 'package:hive/hive.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:heaven_canceller_hospital/shared/shared.dart';
import 'package:heaven_canceller_hospital/ui/ui.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

/// Deklarasi function main() sebagai root method di aplikasi ini
void main() async {
  /// Memanggil ensureInitialized agar dapat menjalankan method dibawahnya
  /// sebelum aplikasi dijalankan saat method runApp() dipanggil.
  WidgetsFlutterBinding.ensureInitialized();

  /// Mendapatkan lokasi direktori aplikasi ini jika sudah diinstall
  var appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();

  /// Inisialisasi hive yang membutuhkan argumen direktori aplikasi ini
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter<Patient>(PatientAdapter());
  await Hive.openBox<Patient>("patients");

  /// Inisialisasi package firebase di aplikasi ini
  await Firebase.initializeApp();

  /// Inisialisasi package onsignal notification di aplikasi ini
  OneSignal.shared.init(oneSignalAppID, iOSSettings: null);
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

  /// Menjalankan aplikasi ini dari root class
  runApp(MyApp());
}

///* MyApp Class - Root Of Project
/// Class yang digunakan untuk memanggil seluruh state management provider,
/// routing screen (halaman) serta menkustomisasi design material flutter

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
