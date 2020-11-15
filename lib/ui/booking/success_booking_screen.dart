part of 'package:heaven_canceller_hospital/ui/ui.dart';

class SuccessBookingScreen extends StatelessWidget {
  static String routeName = "/success_booking_screen";

  @override
  Widget build(BuildContext context) {
    final String bookingID = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: accentColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: accentColor,
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        /// SECTION: IMAGE ILLUSTRATION STATE
                        SizedBox(
                          height: 105 - statusBarHeight(context),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/image/check_success.png",
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Booking Sukses!",
                          style: semiBoldBaseFont.copyWith(
                            color: baseColor,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Kode Booking Anda",
                          style: regularBaseFont.copyWith(
                            color: baseColor,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          bookingID.substring(1, 8).toUpperCase(),
                          style: boldBaseFont.copyWith(
                            color: baseColor,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Custumer Service kami akan menghubungi\nanda untuk konfirmasi selanjutnya",
                          textAlign: TextAlign.center,
                          style: regularBaseFont.copyWith(
                            color: baseColor,
                            fontSize: 12,
                            height: 1.7,
                          ),
                        ),
                        SizedBox(
                          height: 122,
                        ),

                        /// SECTION: BUTTON NEXT NAVIGATION
                        AccentRaisedButton(
                          width: defaultWidth(context),
                          height: 44,
                          borderRadius: 8,
                          color: baseColor,
                          fontColor: accentColor,
                          fontSize: 14,
                          text: "Lihat History",
                          onPressed: () {
                            onGoToHistoryPressed(context);
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          child: Text(
                            "Tidak, Kembali Ke Home",
                            style: regularBaseFont.copyWith(
                              color: baseColor,
                              fontSize: 12,
                            ),
                          ),
                          onTap: () {
                            onGoToHomePressed(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Method ketika tombol "Lihat History" ditekan
  void onGoToHistoryPressed(BuildContext context) {
    Provider.of<BookingProvider>(context, listen: false).loadResource();
    Provider.of<NavigationProvider>(context, listen: false).changeIndex(3, initialPage: 3);

    Navigator.pushNamedAndRemoveUntil(
      context,
      MainScreen.routeName,
      (Route<dynamic> route) => false,
    );
  }

  /// Method ketika tombol "kembali ke home" ditekan
  void onGoToHomePressed(BuildContext context) {
    Provider.of<BookingProvider>(context, listen: false).loadResource();
    Provider.of<NavigationProvider>(context, listen: false).changeIndex(0);
    
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainScreen.routeName,
      (Route<dynamic> route) => false,
    );
  }
}