part of 'services.dart';

class OfficeLocationService {
  static CollectionReference _officeLocationCollection = FirebaseFirestore.instance.collection('office_location');
  
  static Stream<DocumentSnapshot> getSingle() {
    Stream<DocumentSnapshot> snapshot = _officeLocationCollection.doc('C7aNKLkQPElIZv7X1klb').snapshots();

    return snapshot;
  }

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