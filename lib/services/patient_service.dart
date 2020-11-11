part of 'services.dart';

class PatientService {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('patient');

  static Future<void> storeResource(Patient user) async {
    await _userCollection.doc().set({
      'name': user.name,
      'gender': user.gender,
      'email': user.email,
      'phone_number': user.phoneNumber,
      'status': user.status,
    });
  }
}