part of 'package:heaven_canceller_hospital/ui/ui.dart';

class DetailDoctorScreen extends StatelessWidget {
  static String routeName = '/detail_doctor_screen';

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = ModalRoute.of(context).settings.arguments;

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
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      /// SECTION: BACK PHOTO CONTENT
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: doctor.photo,
                            width: deviceWidth(context),
                            height: (getOrientation(context) == Orientation.portrait) ? 275 : 600,
                            fit: BoxFit.cover,
                            placeholder: (_, url) => SpinKitRing(
                              color: accentColor,
                              size: 50,
                            ),
                          ),
                          Container(
                            width: deviceWidth(context),
                            height: 275,
                            color: blackColor.withOpacity(0.3),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 24,
                            left: 20,
                          ),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: 28,
                              color: baseColor,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),

                      /// SECTION: DOCTOR INFO CONTENT
                      Container(
                        width: deviceWidth(context),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(
                          top: 260,
                        ),
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctor.name,
                                      style: semiBoldBaseFont.copyWith(
                                        fontSize: 18,
                                        color: darkGreyColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/image/ic_statescope.png",
                                          width: 16,
                                          height: 16,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          doctor.speciality,
                                          style: regularBaseFont.copyWith(
                                            fontSize: 14,
                                            color: lightGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      doctor.star.toString(),
                                      style: mediumBaseFont.copyWith(
                                        fontSize: 16,
                                        color: darkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Jadwal",
                              style: semiBoldBaseFont.copyWith(
                                fontSize: 16,
                                color: accentColor,
                              ),
                            ),
                            Column(
                              children: doctor.doctorSchedule.map((schedule) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    DoctorScheduleInfo(
                                      day: schedule.dayName,
                                      place: schedule.place,
                                      time: schedule.time,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Biografi",
                              style: semiBoldBaseFont.copyWith(
                                fontSize: 16,
                                color: accentColor,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              doctor.biography,
                              textAlign: TextAlign.start,
                              style: regularBaseFont.copyWith(
                                fontSize: 12,
                                height: 1.7,
                                color: greyColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Pendidikan",
                              style: semiBoldBaseFont.copyWith(
                                fontSize: 16,
                                color: accentColor,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: doctor.education.map((education) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 6,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          education,
                                          style: regularBaseFont.copyWith(
                                            fontSize: 12,
                                            height: 1.7,
                                            color: greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Kredensial",
                              style: semiBoldBaseFont.copyWith(
                                fontSize: 16,
                                color: accentColor,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: doctor.credential.map((credential) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 6,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          credential,
                                          style: regularBaseFont.copyWith(
                                            fontSize: 12,
                                            height: 1.7,
                                            color: greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 78,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// SECTION: BUTTON NEXT NAVIGATION
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: deviceWidth(context),
                    height: 76,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: baseColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFCCCCCC),
                          blurRadius: 20,
                          offset: Offset(0, 0),
                          spreadRadius: -5,
                        ),
                      ],
                    ),
                    child: AccentRaisedButton(
                      width: defaultWidth(context),
                      height: 44,
                      color: accentColor,
                      borderRadius: 8,
                      text: "Buat Janji",
                      fontSize: 14,
                      onPressed: () async {
                        onSubmitPressed(context, doctor);
                      },
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

  /// Method ketika tombol "buat janji" ditekan
  Future<void> onSubmitPressed(BuildContext context, Doctor doctor) async {
    final Box<Patient> patientBox = Hive.box('patients');

    if (patientBox.length != 0) {
      Navigator.pushNamed(context, BookingConfirmationScreen.routeName,
        arguments: doctor,
      );
    } else {
      Navigator.pushNamed(context, RegisterScreen.routeName,
        arguments: doctor,
      );
    }
  }
}