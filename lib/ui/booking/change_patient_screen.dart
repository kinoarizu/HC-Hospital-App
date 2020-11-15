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
    final PatientProvider patientProvider = Provider.of<PatientProvider>(context, listen: false);
    final Box<Patient> patientBox = Hive.box('patients');
    final Patient selfUser = patientBox.getAt(patientProvider.patientIndex);
    
    setState(() {
      selectedPatient = selfUser.name;
    });

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
                    /// SECTION: TITLE BACK BUTTON
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

                    /// SECTION: PATIENT RADIO OPTION
                    Container(
                      height: patientBox.length.toDouble() * 100,
                      child: Consumer<PatientProvider>(
                        builder: (context, patientProvider, _) => ValueListenableBuilder(
                          valueListenable: Hive.box<Patient>('patients').listenable(),
                          builder: (context, patient, _) => ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: patientBox.length,
                            itemBuilder: (_, index) {
                              final Patient patient = patientBox.getAt(index);
                              return PatientRadioOption(
                                name: patient.name,
                                gender: patient.gender,
                                status: patient.status,
                                value: patient.name,
                                groupValue: selectedPatient,
                                onChange: (value) {
                                  setState(() {
                                    selectedPatient = value;
                                    patientProvider.changeIndex(index);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
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
                          Navigator.pushReplacementNamed(context, AddPatientScreen.routeName);
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