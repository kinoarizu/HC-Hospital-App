part of 'services.dart';

///* Class Service OfficeLocation
/// Class untuk menghandle resource lokasi rumah sakit

class OfficeLocationService {
  static CollectionReference _officeLocationCollection = FirebaseFirestore.instance.collection('office_location');
  
  /// Melakukan simpan data collection lokasi rumah sakir
  static Stream<DocumentSnapshot> getSingle() {
    Stream<DocumentSnapshot> snapshot = _officeLocationCollection.doc('C7aNKLkQPElIZv7X1klb').snapshots();

    return snapshot;
  }

  /// Melakukan fetch semua data lokasi rumah sakit 
  static Future<List<OfficeLocation>> getResource() async {
    QuerySnapshot snapshot = await _officeLocationCollection.orderBy('place_name').get();

    List<OfficeLocation> officeLocations = [];

    for (var document in snapshot.docs) {
      officeLocations.add(
        OfficeLocation(
          placeName: document.data()['place_name'],
          address: document.data()['address'],
          regularSchedule: document.data()['regular_schedule'],
          weekendSchedule: document.data()['weekend_schedule'],
          imagePath: document.data()['image_path'],
          mapImage: document.data()['map_image'],
        ),
      );
    }

    return officeLocations;
  }
}