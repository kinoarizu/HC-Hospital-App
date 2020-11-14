part of 'services.dart';

class PatientService {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('patients');

  static Future<void> storeResource(Patient patient) async {
    await _userCollection.doc().set({
      'id': patient.id,
      'name': patient.name,
      'gender': patient.gender,
      'email': patient.email,
      'phone_number': patient.phoneNumber,
      'status': patient.status,
    });
  }
}