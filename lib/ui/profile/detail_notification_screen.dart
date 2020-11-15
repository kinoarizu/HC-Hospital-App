part of 'package:heaven_canceller_hospital/ui/ui.dart';

class DetailNotificationScreen extends StatelessWidget {
  static String routeName = '/detail_notification_screen';

  @override
  Widget build(BuildContext context) {
    final PersonalNotification personalNotification = ModalRoute.of(context).settings.arguments;

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
                  color: baseColor,
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: GestureDetector(
                              child: Icon(
                                Icons.arrow_back,
                                color: darkGreyColor,
                                size: 28,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Align(  
                          alignment: Alignment.center,
                          child: Text(
                            "Detail Notifikasi",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 18,
                              color: darkGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          Text(
                            personalNotification.type,
                            style: mediumBaseFont.copyWith(
                              color: accentColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            personalNotification.title,
                            style: semiBoldBaseFont.copyWith(
                              color: darkGreyColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            DateTime.fromMillisecondsSinceEpoch(personalNotification.time).dateAndtime,
                            style: semiBoldBaseFont.copyWith(
                              color: accentColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/image/ic_location.png",
                                width: 12,
                                height: 12,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Rumah Sakit Heaven Canceller",
                                style: regularBaseFont.copyWith(
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            personalNotification.content,
                            style: regularBaseFont.copyWith(
                              fontSize: 12,
                              height: 1.7,
                              color: darkGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}