part of 'services.dart';

class ContactComplaintService {
  static CollectionReference _contactComplaintCollection = FirebaseFirestore.instance.collection('contact_complaint');

  static Future<List<ContactComplaint>> getResource() async {
    QuerySnapshot snapshot = await _contactComplaintCollection.get();

    List<ContactComplaint> contactComplaint = [];

    for (var document in snapshot.docs) {
      contactComplaint.add(
        ContactComplaint(
          contact: document.data()['contact'],
          iconPath: document.data()['icon'],
          launcher: document.data()['launcher'],
        ),
      );
    }

    return contactComplaint;
  }
}