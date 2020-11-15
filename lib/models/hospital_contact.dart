part of 'models.dart';

///* Class Model HospitalContact
/// Model untuk mengelola data collection kontak untuk menghububgi rumah sakit

class HospitalContact extends Equatable {
  final String title;
  final String iconPath;
  final List<String> firstContact;
  final List<String> secondContact;
  final List<String> thirdContact;

  HospitalContact({
    this.title,
    this.iconPath,
    this.firstContact,
    this.secondContact,
    this.thirdContact,
  });

  @override
  List<Object> get props => [title, iconPath, firstContact, secondContact, thirdContact];
}