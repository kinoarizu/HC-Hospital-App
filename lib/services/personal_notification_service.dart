part of 'services.dart';

///* Class Service PersonalNotification
/// Class untuk menghandle resource notifikasi pengguna

class PersonalNotificationService {
  static CollectionReference _personalNotificationCollection = FirebaseFirestore.instance.collection('personal_notification');

  /// Melakukan fetch semua data notifikasi pengguna
  static Future<List<PersonalNotification>> getResource() async {
    QuerySnapshot snapshot = await _personalNotificationCollection.get();

    List<PersonalNotification> personalNotifications = [];

    for (var document in snapshot.docs) {
      personalNotifications.add(
        PersonalNotification(
          title: document.data()['title'],
          subtitle: document.data()['subtitle'],
          imagePath: document.data()['image_path'],
          type: document.data()['type'],
          content: document.data()['content'],
          time: document.data()['time'],
        ),
      );
    }

    return personalNotifications;
  }
}