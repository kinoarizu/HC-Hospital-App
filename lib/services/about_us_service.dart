part of 'services.dart';

class AboutUsService {
  static CollectionReference _aboutUsCollection = FirebaseFirestore.instance.collection('about_us');
  
  static Stream<DocumentSnapshot> getSingle() {
    Stream<DocumentSnapshot> snapshot = _aboutUsCollection.doc('FobvAEde2jPmKlPAYjuL').snapshots();

    return snapshot;
  }
}