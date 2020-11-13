part of 'services.dart';

class BookingService {
  static CollectionReference _bookingCollection = FirebaseFirestore.instance.collection('bookings');
  
  static Future<void> storeResource(Booking booking) async {
    await _bookingCollection.doc().set({
      'id': booking.id,
      'schedule': booking.schedule,
      'message': booking.message,
      'doctor': booking.doctor.toJson(),
      'patient': booking.patient.toJson(),
    });
  }
}