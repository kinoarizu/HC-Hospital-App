part of 'services.dart';

class UserService {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> storeUser(User user) async {
    await _userCollection.doc().set({
      'name': user.name,
      'gender': user.gender,
      'email': user.email,
      'phone_number': user.phoneNumber,
    });
  }
}