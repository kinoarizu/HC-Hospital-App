part of 'package:heaven_canceller_hospital/ui/ui.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/main_screen';
  
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation = Provider.of<NavigationProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: accentColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: baseColor,
                ),
                PageView(
                  controller: navigation.pageIndex,
                  onPageChanged: (index) {
                    navigation.changeIndex(index);
                  },
                  children: [
                    HomeScreen(),
                    ServiceScreen(),
                    BookingScreen(),
                    ProfileScreen(),
                    PartnerCareerScreen(),
                  ],
                ),
                BottomNavbar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}