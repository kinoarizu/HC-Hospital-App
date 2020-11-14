part of 'models.dart';

class Doctor extends Equatable {
  final String name;
  final String gender;
  final String speciality;
  final String photo;
  final int star;
  final String status;
  final String biography;
  final List<String> education;
  final List<String> credential;
  final List<DoctorSchedule> doctorSchedule;

  Doctor({
    this.name,
    this.gender,
    this.speciality,
    this.photo,
    this.star,
    this.status,
    this.biography,
    this.education,
    this.credential,
    this.doctorSchedule,
  });

  @override
  List<Object> get props => [
    name,
    gender,
    speciality,
    photo,
    star,
    status,
    biography,
    education,
    credential,
    doctorSchedule,
  ];

  Map<String, dynamic> toJson() => {
    'name': name,
    'speciality': speciality,
    'photo': photo,
  };

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    name: json['name'],
    gender: json['gender'],
    speciality: json['speciality'],
    photo: json['photo'],
    star: json['star'],
    status: json['status'],
    biography: json['biography'],
    education: json['education'],
    credential: json['credential'],
  );

  static String generateTimeAvailable(List<DoctorSchedule> doctorSchedule) {
    String timeWork = doctorSchedule.singleWhere((element) {
      return DateTimeUtil.generateValidDayName(element.dayName) == DateTime.now().weekday;
    }, orElse: () => DoctorSchedule(
      time: "Libur"
    )).time;

    return timeWork;
  }
}
