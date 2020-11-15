part of 'services.dart';

///* Class Service ServiceFacility
/// Class untuk menghandle resource fasilitas dan layanan

class ServiceFacilityService {
  static CollectionReference _serviceFasilityCollection = FirebaseFirestore.instance.collection('service_facility');

  /// Melakukan fetch semua data fasilitas dan layanan
  static Future<List<ServiceFacility>> getResource() async {
    QuerySnapshot snapshot = await _serviceFasilityCollection.get();

    List<ServiceFacility> serviceFacilities = [];

    for (var document in snapshot.docs) {
      serviceFacilities.add(
        ServiceFacility(
          name: document.data()['name'],
          type: document.data()['type'],
          imagePath: document.data()['image_path'],
          content: (document.data()['content'] as List).map((e) => e.toString()).toList(),
        ),
      );
    }

    return serviceFacilities;
  }
}