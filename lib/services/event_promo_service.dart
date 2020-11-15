part of 'services.dart';

///* Class Service EventPromo
/// Class untuk menghandle resource event dan promo rumah sakit

class EventPromoService {
  static CollectionReference _eventPromoCollection = FirebaseFirestore.instance.collection('event_promo');

  /// Melakukan fetch semua data event promo
  static Future<List<EventPromo>> getResource() async {
    QuerySnapshot snapshot = await _eventPromoCollection.get();

    List<EventPromo> eventPromos = [];

    for (var document in snapshot.docs) {
      eventPromos.add(
        EventPromo(
          title: document.data()['title'],
          imageURL: document.data()['image_url'],
          type: document.data()['type'],
          date: document.data()['date'],
          content: (document.data()['content'] as List).map((e) => e.toString()).toList(),
        ),
      );
    }

    return eventPromos;
  }
}