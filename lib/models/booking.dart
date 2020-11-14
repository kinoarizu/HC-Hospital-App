part of 'models.dart';

class Booking extends Equatable {
  final String id;
  final String userID;
  final Doctor doctor;
  final Patient patient;
  final String schedule;
  final String message;
  final int time;

  Booking({
    this.id,
    this.userID,
    this.doctor,
    this.patient,
    this.schedule,
    this.message,
    this.time,
  });

  @override
  List<Object> get props => [
    id,
    userID,
    doctor,
    patient,
    schedule,
    message,
    time,
  ];
}