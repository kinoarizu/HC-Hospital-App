part of 'models.dart';

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