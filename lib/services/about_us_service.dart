part of 'services.dart';

///* Class Service AboutUs
/// Class untuk menghandle resource tentang rumah sakit

class AboutUsService {
  static CollectionReference _aboutUsCollection = FirebaseFirestore.instance.collection('about_us');
  
  /// Mlakukan fetch single data berdasarkan collection id
  static Stream<DocumentSnapshot> getSingle() {
    Stream<DocumentSnapshot> snapshot = _aboutUsCollection.doc('FobvAEde2jPmKlPAYjuL').snapshots();

    return snapshot;
  }
}