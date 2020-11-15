import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'patient.g.dart';

///* Class Model Patient
/// Model untuk mengelola data collection pasien rumah sakit

@HiveType(typeId: 1)
class Patient extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String gender;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phoneNumber;

  @HiveField(5)
  final String status;

  Patient({
    this.id,
    this.name,
    this.gender,
    this.email,
    this.phoneNumber,
    this.status,
  });

  @override
  List<Object> get props => [id, name, gender, email, phoneNumber, status];

  /// Mengubah data pasien dari object class menjadi json
  Map<String, dynamic> toJson() => {
    'name': name,
    'gender': gender,
    'status': status,
  };

  /// Mengubah data pasien dari json menjadi object class
  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'],
    name: json['name'],
    gender: json['gender'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    status: json['status'],
  );

  /// Menambahkan data pasien ke local database
  static void register(Patient patient) {
    Box<Patient> patientBox = Hive.box('patients');
    patientBox.add(patient);
  }
}