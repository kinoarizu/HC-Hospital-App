part of 'package:heaven_canceller_hospital/ui/screens/screens.dart';

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
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://st.depositphotos.com/1258191/3252/i/450/depositphotos_32524605-stock-photo-portrait-of-a-handsome-doctor.jpg",
                            width: deviceWidth(context),
                            height: 275,
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
                                      "Dr. William, SOD",
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
                                          "Spesialis Otak",
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
                                      "4.8",
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
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                DoctorScheduleInfo(
                                  day: "Senin",
                                  time: "08.00 - 17.00",
                                  place: "HC Hospital",
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                DoctorScheduleInfo(
                                  day: "Senin",
                                  time: "08.00 - 17.00",
                                  place: "HC Hospital",
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                DoctorScheduleInfo(
                                  day: "Senin",
                                  time: "08.00 - 17.00",
                                  place: "HC Hospital",
                                ),
                              ],
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
                              "Dr. William mendirikan Indonesische Studie Club (ISC) yang merupakan wabah bagi kaum terpelajar Indonesia. ISC berhasil mendirikan sekolah tenun, bank kredit, koperasi dan sebagainya. Pada tahun 1931 ISC berganti nama menjadi Persatuan Bangsa Indonesia (PBI). Di bawah pimpinan Soetomo PBI cepat berkembang.",
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
                                  "S1 Fakultas Kedokteran Universitas Yasri",
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
                                  "S2 Fakultas Kedokteran Universitas Hasanudin",
                                  style: regularBaseFont.copyWith(
                                    fontSize: 12,
                                    height: 1.7,
                                    color: greyColor,
                                  ),
                                ),
                              ],
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
                                  "Sertifikat Praktik Ikatan Dokter Indonesia",
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
                                  "International Health Certification Birmigham",
                                  style: regularBaseFont.copyWith(
                                    fontSize: 12,
                                    height: 1.7,
                                    color: greyColor,
                                  ),
                                ),
                              ],
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
                      onPressed: () {},
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
}