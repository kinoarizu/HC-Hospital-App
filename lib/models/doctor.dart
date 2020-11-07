part of 'models.dart';

class Doctor extends Equatable {
  final String name;
  final String speciality;
  final String photo;
  final String time;

  Doctor({
    this.name,
    this.speciality,
    this.photo,
    this.time,
  });

  @override
  List<Object> get props => [name, speciality, photo, time];
}