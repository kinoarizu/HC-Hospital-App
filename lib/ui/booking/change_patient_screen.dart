part of 'package:heaven_canceller_hospital/ui/ui.dart';

class ChangePatientScreen extends StatefulWidget {
  static String routeName = '/change_patient_screen';
  
  @override
  _ChangePatientScreenState createState() => _ChangePatientScreenState();
}

class _ChangePatientScreenState extends State<ChangePatientScreen> {
  String selectedPatient = "Wasitoya";

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
                        PatientRadioOption(
                          name: "Budiman",
                          gender: "Pria",
                          status: "Saya Sendiri",
                          value: "Budiman",
                          groupValue: selectedPatient,
                          onChange: (value) {
                            setState(() {
                              selectedPatient = value;
                            });
                          },
                        ),
                        PatientRadioOption(
                          name: "Wasitoya",
                          gender: "Pria",
                          status: "Kerabat",
                          value: "Wasitoya",
                          groupValue: selectedPatient,
                          onChange: (value) {
                            setState(() {
                              selectedPatient = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: GestureDetector(
                        child: Text(
                          "Tambah Pasien",
                          style: mediumBaseFont.copyWith(
                            color: accentColor,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, AddPatientScreen.routeName);
                        },
                      ),
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