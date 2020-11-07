part of 'services.dart';

class DoctorService {
  static CollectionReference _doctorCollection = FirebaseFirestore.instance.collection('doctors');

  static Future<List<Doctor>> getResource() async {
    QuerySnapshot snapshot = await _doctorCollection.get();

    List<Doctor> doctors = [];

    for (var document in snapshot.docs) {
      doctors.add(
        Doctor(
          name: document.data()['name'],
          speciality: document.data()['speciality'],
          photo: document.data()['photo'],
          time: document.data()['time'],
        ),
      );
    }

    return doctors;
  }
}