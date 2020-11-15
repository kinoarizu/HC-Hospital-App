part of 'services.dart';

///* Class Service HospitalContact
/// Class untuk menghandle resource kontak rumah sakit

class HospitalContactService {
  static CollectionReference _hospitalContactCollection = FirebaseFirestore.instance.collection('hospital_contact');

  /// Melakukan fetch semua data kontak rumah sakit
  static Future<List<HospitalContact>> getResource() async {
    QuerySnapshot snapshot = await _hospitalContactCollection.get();

    List<HospitalContact> hospitalContacts = [];

    for (var document in snapshot.docs) {
      hospitalContacts.add(
        HospitalContact(
          title: document.data()['title'],
          iconPath: document.data()['icon_path'],
          firstContact: (document.data()['first_contact'] as List).map((e) => e.toString()).toList(),
          secondContact: (document.data()['second_contact'] as List).map((e) => e.toString()).toList(),
          thirdContact: (document.data()['third_contact'] as List).map((e) => e.toString()).toList(),
        ),
      );
    }

    return hospitalContacts;
  }
}