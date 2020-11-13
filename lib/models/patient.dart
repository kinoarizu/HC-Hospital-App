import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'patient.g.dart';

@HiveType(typeId: 1)
class Patient extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phoneNumber;

  @HiveField(4)
  final String status;

  Patient({
    this.name,
    this.gender,
    this.email,
    this.phoneNumber,
    this.status,
  });

  @override
  List<Object> get props => [name, gender, email, phoneNumber, status];

  Patient.fromJson(Map<String, dynamic> json) : 
    name = json['name'],
    gender = json['gender'],
    email = json['email'],
    phoneNumber = json['phone_number'],
    status = json['status']
  ;

  Map<String, dynamic> toJson() => {
    'name': name,
    'gender': gender,
    'status': status,
  };

  static void register(Patient patient) {
    Box<Patient> patientBox = Hive.box('patients');
    patientBox.add(patient);
  }
}