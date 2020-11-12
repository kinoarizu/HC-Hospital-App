part of 'package:heaven_canceller_hospital/ui/ui.dart';

class ChangePatientScreen extends StatefulWidget {
  static String routeName = '/change_patient_screen';
  
  @override
  _ChangePatientScreenState createState() => _ChangePatientScreenState();
}

class _ChangePatientScreenState extends State<ChangePatientScreen> {
  String selectedPatient;

  @override
  Widget build(BuildContext context) {
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: defaultMargin,
                        left: defaultMargin,
                        right: defaultMargin,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              child: Consumer<ValidationProvider>(
                                builder: (context, validation, _) => Icon(
                                  Icons.arrow_back,
                                  color: darkGreyColor,
                                  size: 28,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Align(  
                            alignment: Alignment.center,
                            child: Text(
                              "Ganti Pasien",
                              style: semiBoldBaseFont.copyWith(
                                fontSize: 18,
                                color: darkGreyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              vertical: BorderSide(
                                color: lightGreyColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    ("Nama: Abu Azis").replaceAll(RegExp(r'"'), ""),
                                    textAlign: TextAlign.start,
                                    style: regularBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 12,
                                      height: 1.7,
                                    ),
                                  ),
                                  Text(
                                    ("Jenis Kelamin: Pria").replaceAll(RegExp(r'"'), ""),
                                    textAlign: TextAlign.start,
                                    style: regularBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 12,
                                      height: 1.7,
                                    ),
                                  ),
                                  Text(
                                    ("Status: Saya Sendiri").replaceAll(RegExp(r'"'), ""),
                                    textAlign: TextAlign.start,
                                    style: regularBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 12,
                                      height: 1.7,
                                    ),
                                  ),
                                ],
                              ),
                              CustomRadioButton(
                                size: 24,
                                value: "Pria",
                                groupValue: selectedPatient,
                                onChange: (value) {
                                  setState(() {
                                    selectedPatient = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              vertical: BorderSide(
                                color: lightGreyColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    ("Nama: Abu Azis").replaceAll(RegExp(r'"'), ""),
                                    textAlign: TextAlign.start,
                                    style: regularBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 12,
                                      height: 1.7,
                                    ),
                                  ),
                                  Text(
                                    ("Jenis Kelamin: Pria").replaceAll(RegExp(r'"'), ""),
                                    textAlign: TextAlign.start,
                                    style: regularBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 12,
                                      height: 1.7,
                                    ),
                                  ),
                                  Text(
                                    ("Status: Saya Sendiri").replaceAll(RegExp(r'"'), ""),
                                    textAlign: TextAlign.start,
                                    style: regularBaseFont.copyWith(
                                      color: greyColor,
                                      fontSize: 12,
                                      height: 1.7,
                                    ),
                                  ),
                                ],
                              ),
                              CustomRadioButton(
                                size: 24,
                                value: "Pria",
                                groupValue: selectedPatient,
                                onChange: (value) {
                                  setState(() {
                                    selectedPatient = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      child: Text(
                        "Tambah Pasien",
                        style: mediumBaseFont.copyWith(
                          color: accentColor,
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {
                        
                      },
                    ),
                    SizedBox(
                      height: 80,
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