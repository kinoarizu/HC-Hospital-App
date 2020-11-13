part of 'services.dart';

class PartnerService {
  static CollectionReference _partnerCollection = FirebaseFirestore.instance.collection('partners');

  static Future<List<Partner>> getResource() async {
    QuerySnapshot snapshot = await _partnerCollection.get();

    List<Partner> partners = [];

    for (var document in snapshot.docs) {
      partners.add(
        Partner(
          title: document.data()['title'],
          imageURL: document.data()['image_url'],
        ),
      );
    }

    return partners;
  }
}