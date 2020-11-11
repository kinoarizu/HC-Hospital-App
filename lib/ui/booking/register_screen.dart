part of 'package:heaven_canceller_hospital/ui/ui.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController handphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String selectedGender;
  bool isSubmit = false;

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
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 24,
                    ),
                    child: Consumer<ValidationProvider>(
                      builder: (context, validation, _) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
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
                                    validation.resetChange();
                                  },
                                ),
                              ),
                              Align(  
                                alignment: Alignment.center,
                                child: Text(
                                  "Daftar Pasien",
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
                          Text(
                            "Maaf, anda belum terdaftar dalam aplikasi. Harap daftar terlebih dahulu untuk dapat membooking jadwal dengan dokter yang bersangkutan.",
                            maxLines: 3,
                            style: mediumBaseFont.copyWith(
                              fontSize: 12,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          CustomTextField(
                            controller: nameController,
                            labelText: "Nama Pasien",
                            hintText: "Masukan Nama Pasien",
                            errorValidation: validation.errorName,
                            onChanged: (value) {
                              validation.changeName(value);
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jenis Kelamin",
                                style: mediumBaseFont.copyWith(
                                  fontSize: 12,
                                  color: darkGreyColor,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomRadioButton(
                                    value: "Pria",
                                    groupValue: selectedGender,
                                    onChange: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 32,
                                  ),
                                  CustomRadioButton(
                                    value: "Wanita",
                                    groupValue: selectedGender,
                                    onChange: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          CustomTextField(
                            controller: handphoneController,
                            labelText: "No Handphone",
                            hintText: "Masukan No Handphone",
                            keyboardType: TextInputType.phone,
                            errorValidation: validation.errorPhoneNumber,
                            onChanged: (value) {
                              validation.changePhoneNumber(value);
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          CustomTextField(
                            controller: emailController,
                            labelText: "Email",
                            hintText: "Masukan Email",
                            keyboardType: TextInputType.emailAddress,
                            errorValidation: validation.errorEmail,
                            onChanged: (value) {
                              validation.changeEmail(value);
                            },
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          if (!isSubmit) AccentRaisedButton(
                            color: accentColor,
                            width: defaultWidth(context),
                            text: "Daftar",
                            height: 44,
                            fontSize: 14,
                            borderRadius: 8,
                            onPressed: validation.isAllValidate() ? () {
                              setState(() {
                                isSubmit = true;
                              });

                              onSubmitPressed(
                                validation: validation,
                                patient: Patient(
                                  name: nameController.text,
                                  gender: selectedGender,
                                  email: emailController.text,
                                  phoneNumber: handphoneController.text,
                                  status: "Saya Sendiri"
                                ),
                              );
                            } : null,
                          ) else SpinKitRing(
                            color: accentColor,
                            size: 40,
                          ),
                        ],
                      ),
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

  Future<void> onSubmitPressed({ValidationProvider validation, Patient patient}) async {
    if (selectedGender == null) {
      Flushbar(
        duration: Duration(milliseconds: 1500),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Color(0xFFFF5C83),
        message: "Jenis Kelamin Harus Diisikan",
      )..show(context);
    }

    await SharedPreferenceUtil.setPreference('patient', patient);

    await PatientService.storeResource(patient);

    Navigator.pushNamed(context, BookingConfirmationScreen.routeName);
    validation.resetChange();
  }
}