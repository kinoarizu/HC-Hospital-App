part of 'models.dart';

class Booking extends Equatable {
  final String id;
  final Doctor doctor;
  final Patient patient;
  final String schedule;
  final String message;

  Booking({
    this.id,
    this.doctor,
    this.patient,
    this.schedule,
    this.message,
  });

  @override
  List<Object> get props => [
    id,
    doctor,
    patient,
    schedule,
    message,
  ];
}