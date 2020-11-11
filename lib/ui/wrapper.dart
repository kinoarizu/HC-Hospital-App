part of 'ui.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<EventPromoProvider>(context).loadResource();
    Provider.of<DoctorProvider>(context).loadResource();
    Provider.of<NewsProvider>(context).loadResource();
    Provider.of<ServiceFacilityProvider>(context).loadResource();

    return Scaffold(
      body: MainScreen(),
    );
  }
}