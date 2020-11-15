part of 'package:heaven_canceller_hospital/ui/ui.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationTab = true;

  @override
  Widget build(BuildContext context) {
    final Box<Patient> patientBox = Hive.box('patients');

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
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 24,
                            left: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/image/ic_profile_white.png",
                                width: 28,
                                height: 28,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Profile",
                                style: semiBoldBaseFont.copyWith(
                                  color: baseColor,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: deviceWidth(context),
                            height: (275 + 106 * 4).toDouble(),  
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            margin: EdgeInsets.only(
                              top: 160,
                            ),
                            decoration: BoxDecoration(
                              color: baseColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: (patientBox.isNotEmpty) ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      patientBox.getAt(0).name,
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 14,
                                        color: darkGreyColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      patientBox.getAt(0).gender,
                                      style: regularBaseFont.copyWith(
                                        fontSize: 12,
                                        color: greyColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      patientBox.getAt(0).phoneNumber,
                                      style: regularBaseFont.copyWith(
                                        fontSize: 12,
                                        color: lightGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  width: defaultWidth(context),
                                  height: 43,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: (isNotificationTab) ? baseColor : Colors.transparent,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Notifikasi",
                                                  style: semiBoldBaseFont.copyWith(
                                                    fontSize: 12.5,
                                                    color: darkGreyColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                    color: orangeColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Consumer<PersonalNotificationProvider>(
                                                      builder: (context, notification, _) => Text(
                                                        notification.personalNotification.length.toString(),
                                                        style: semiBoldBaseFont.copyWith(
                                                          fontSize: 10,
                                                          color: baseColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              isNotificationTab = true;
                                            });
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: (!isNotificationTab) ? baseColor : Colors.transparent,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Riwayat",
                                                  style: semiBoldBaseFont.copyWith(
                                                    fontSize: 12.5,
                                                    color: darkGreyColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                    color: orangeColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Consumer<BookingProvider>(
                                                      builder: (context, bookingProvider, _) => Text(
                                                        bookingProvider.bookings.length.toString(),
                                                        style: semiBoldBaseFont.copyWith(
                                                          fontSize: 10,
                                                          color: baseColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              isNotificationTab = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                if (isNotificationTab) Consumer<PersonalNotificationProvider>(
                                  builder: (context, notification, _) => Column(
                                    children: notification.personalNotification.map((notif) {
                                      return NotificationPersonalCard(
                                        notif,
                                        isNew: true,
                                        onTap: () {
                                          Navigator.pushNamed(context, DetailNotificationScreen.routeName,
                                            arguments: notif,
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                                if (!isNotificationTab) Consumer<BookingProvider>(
                                  builder: (context, bookingProvider, _) {
                                    if (bookingProvider.bookings.length != 0) {
                                      return Column(
                                        children: bookingProvider.bookings.map((booking){
                                          return HistoryPersonalCard(
                                            booking,
                                            isFinish: false,
                                            onTap: () {},
                                          );
                                        }).toList(),
                                      );
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: EmptyViewState(),
                                    );
                                  },
                                ),
                              ],
                            ) : Container(
                              height: 180,
                              margin: EdgeInsets.only(
                                top: 64,
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/image/unauth.png",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Kamu Belum Membuat Akun,\nSilahkan Registrasi",
                                    textAlign: TextAlign.center,
                                    style: mediumBaseFont.copyWith(
                                      fontSize: 13,
                                      color: darkGreyColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  AccentRaisedButton(
                                    width: 180,
                                    height: 44,
                                    borderRadius: 8,
                                    color: accentColor,
                                    fontColor: baseColor,
                                    fontSize: 13,
                                    text: "Buat Akun",
                                    onPressed: () {
                                      Navigator.pushNamed(context, RegisterScreen.routeName);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (patientBox.isNotEmpty) Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(
                                top: 110,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/image/female_placeholder.jpg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}