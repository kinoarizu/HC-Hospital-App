part of 'package:heaven_canceller_hospital/ui/ui.dart';

class BookingConfirmationScreen extends StatefulWidget {
  static String routeName = '/booking_confirmation_screen';

  @override
  _BookingConfirmationScreenState createState() => _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  String selectedTime;
  List<DateTime> dates;
  DateTime selectedDate;

  TextEditingController messageController = TextEditingController();

  bool isSubmit = false;

  @override
  void initState() {
    super.initState();

    dates = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final PatientProvider patientProvider = Provider.of<PatientProvider>(context);
    final Box<Patient> patientBox = Hive.box('patients');
    final Patient patient = patientBox.getAt(patientProvider.patientIndex);
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
                              "Konfirmasi Booking",
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
                      height: 36,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: doctor.photo,
                            placeholder: (_, url) => SpinKitRing(
                              color: accentColor,
                              size: 40,
                            ),
                            imageBuilder: (_, provider) => Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3,
                                  color: accentColor,
                                ),
                                image: DecorationImage(
                                  image: provider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: semiBoldBaseFont.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                doctor.speciality,
                                style: regularBaseFont.copyWith(
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      width: deviceWidth(context),
                      height: 12,
                      color: Color(0xFFEEEEEE),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          child: Text(
                            "Detail Booking",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 14,
                              color: accentColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          width: deviceWidth(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                            vertical: 18,
                          ),
                          color: Color(0xFFEEEEEE),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Booking Untuk",
                                    style: semiBoldBaseFont.copyWith(
                                      color: darkGreyColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Ganti Pasien",
                                      style: mediumBaseFont.copyWith(
                                        fontSize: 11,
                                        color: accentColor,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, ChangePatientScreen.routeName);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Nama: ${patient.name}",
                                textAlign: TextAlign.start,
                                style: regularBaseFont.copyWith(
                                  color: greyColor,
                                  fontSize: 11,
                                  height: 1.7,
                                ),
                              ),
                              Text(
                                "Jenis Kelamin: ${patient.gender}",
                                textAlign: TextAlign.start,
                                style: regularBaseFont.copyWith(
                                  color: greyColor,
                                  fontSize: 11,
                                  height: 1.7,
                                ),
                              ),
                              Text(
                                "Status: ${patient.status}",
                                textAlign: TextAlign.start,
                                style: regularBaseFont.copyWith(
                                  color: greyColor,
                                  fontSize: 11,
                                  height: 1.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          child: Text(
                            "Booking Waktu",
                            style: semiBoldBaseFont.copyWith(
                              color: darkGreyColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 76,
                          child: ListView.builder(
                            itemCount: dates.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: (index != 6) ? 12 : 20,
                                  left: (index != 0) ? 0 : 20,
                                ),
                                child: SelectableDateButton(
                                  date: dates[index].day.toString(),
                                  dayName: dates[index].shortDayName,
                                  isSelected: selectedDate == dates[index],
                                  onTap: () {
                                    setState(() {
                                      selectedDate = dates[index];
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: defaultMargin,
                          ),
                          child: Row(
                            children: doctor.doctorSchedule.map((schedule) {
                              return SelectableBoxButton(
                                borderRadius: 20,
                                thickBorder: 1.5,
                                borderColor: lightGreyColor,
                                fontColor: greyColor,
                                content: schedule.time,
                                isSelected: selectedTime == schedule.time,
                                onTap: () {
                                  setState(() {
                                    selectedTime = schedule.time;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          child: Text(
                            "Pesan Pribadi",
                            style: semiBoldBaseFont.copyWith(
                              color: darkGreyColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          child: CustomTextField(
                            controller: messageController,
                            hintText: "Catatan Untuk Dokter",
                            maxLines: 4,
                            fontSize: 13,
                            onChanged: (value) {
                              
                            },
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  ],
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
                    child: (!isSubmit) ? AccentRaisedButton(
                      width: defaultWidth(context),
                      height: 44,
                      color: accentColor,
                      borderRadius: 8,
                      text: "Konfirmasi",
                      fontSize: 14,
                      onPressed: () async {
                        setState(() {
                          isSubmit = true;
                        });
                        onSubmitPressed(
                          context,
                          doctor: doctor,
                          patientID: patient.id,
                          patientName: patient.name,
                          patientGender: patient.gender,
                          patientStatus: patient.status,
                        );
                      },
                    ) : SpinKitRing(
                      color: accentColor,
                      size: 40,
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

  Future<void> onSubmitPressed(BuildContext context, {Doctor doctor, String patientID, String patientName, String patientGender, String patientStatus}) async {
    if (selectedDate == null) {
      setState(() {
        isSubmit = false;
      });

      Flushbar(
        duration: Duration(milliseconds: 1500),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Color(0xFFFF5C83),
        message: "Harap Pilih Tanggal Booking",
      )..show(context);
    } 
    else if (selectedTime == null) {
      setState(() {
        isSubmit = false;
      });      

      Flushbar(
        duration: Duration(milliseconds: 1500),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Color(0xFFFF5C83),
        message: "Harap Pilih Jam Booking",
      )..show(context);
    }
    else {
      Uuid uuid = Uuid();

      Booking booking = Booking(
        id: uuid.v4(),
        userID: patientID,
        doctor: doctor,
        schedule: "${selectedDate.day} ${selectedDate.monthName} ${selectedDate.year}, $selectedTime",
        message: messageController.text ?? "-",
        time: DateTime.now().millisecondsSinceEpoch,
        patient: Patient(
          name: patientName,
          gender: patientGender,
          status: patientStatus,
        ),
      );

      await BookingService.storeResource(booking);

      await NotificationUtil.pushNotification(
        heading: "Sukses Melakukan Booking",
        content: "Silahkan datang pada jadwal yang telah anda tentukan.",
      );
      
      Navigator.pushReplacementNamed(context, SuccessBookingScreen.routeName,
        arguments: booking.id,
      );
    }
  }
}