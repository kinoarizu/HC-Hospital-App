import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:heaven_canceller_hospital/provider/provider.dart';
import 'package:heaven_canceller_hospital/shared/shared.dart';
import 'package:heaven_canceller_hospital/ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

///* MyApp Class - Root Of Project

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => CarouselProvider()),
        ChangeNotifierProvider(create: (_) => EventPromoProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => ServiceFacilityProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => ValidationProvider()),
      ],
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
