part of 'shared.dart';

///* Page Route

/// Berisi map value yang digunakan untuk mendeklarasikan route yang 
/// ada berdasarkan [routeName] yang telah dibuat pada setiap screen.

Map<String, WidgetBuilder> appRoute = {
  MainScreen.routeName: (BuildContext context) => MainScreen(),
  EventPromoScreen.routeName: (BuildContext context) => EventPromoScreen(),
  AboutUsScreen.routeName: (BuildContext context) => AboutUsScreen(),
  DetailDoctorScreen.routeName: (BuildContext context) => DetailDoctorScreen(),
  LatestNewsScreen.routeName: (BuildContext context) => LatestNewsScreen(),
  DetailServiceScreen.routeName: (BuildContext context) => DetailServiceScreen(),
  RegisterScreen.routeName: (BuildContext context) => RegisterScreen(),
  BookingConfirmationScreen.routeName: (BuildContext context) => BookingConfirmationScreen(),
  ChangePatientScreen.routeName: (BuildContext context) => ChangePatientScreen(),
  AddPatientScreen.routeName: (BuildContext context) => AddPatientScreen(),
  SuccessBookingScreen.routeName: (BuildContext context) => SuccessBookingScreen(),
  FeedbackWebviewScreen.routeName: (BuildContext context) => FeedbackWebviewScreen(),
  PartnerCareerScreen.routeName: (BuildContext context) => PartnerCareerScreen(),
};