part of 'services.dart';

///* Class Service Doctor
/// Class untuk menghandle resource dokter rumah sakit

class DoctorService {
  static CollectionReference _doctorCollection = FirebaseFirestore.instance.collection('doctors');

  /// Melakukan fetch semua data dokter
  static Future<List<Doctor>> getResource() async {
    QuerySnapshot snapshot = await _doctorCollection.get();

    List<Doctor> doctors = [];

    for (var document in snapshot.docs) {
      doctors.add(
        Doctor(
          name: document.data()['name'],
          gender: document.data()['gender'],
          speciality: document.data()['speciality'],
          photo: document.data()['photo'],
          star: document.data()['star'],
          status: document.data()['status'],
          biography: document.data()['biography'],
          education: (document.data()['education'] as List).map((e) => e.toString()).toList(),
          credential: (document.data()['credential'] as List).map((e) => e.toString()).toList(),
          doctorSchedule: (document.data()['schedule'] as List).map((data) => DoctorSchedule.fromJson(data)).toList(),
        ),
      );
    }

    return doctors;
  }
}