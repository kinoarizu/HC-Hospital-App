part of 'services.dart';

///* Class Service Patient
/// Class untuk menghandle resource pasien rumah sakit

class PatientService {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('patients');

  /// Melakukan simpan data collection pasien rumah sakit
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