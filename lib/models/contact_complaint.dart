part of 'models.dart';

///* Class Model ContactComplaint
/// Model untuk mengelola data collection kontak darurat dan komplain pengguna

class ContactComplaint extends Equatable {
  final String contact;
  final String iconPath;
  final String launcher;

  ContactComplaint({
    this.contact,
    this.iconPath,
    this.launcher,
  });

  @override
  List<Object> get props => [contact, iconPath];
}