part of 'provider.dart';

///* Class Provider PersonalNotification
/// Class untuk menghandle state data notifikasi pengguna 

class PersonalNotificationProvider extends ChangeNotifier {
  List<PersonalNotification> _personalNotification;

  List<PersonalNotification> get personalNotification => _personalNotification;

  /// Memuat data notifikasi dari notifikasi service firebase
  void loadResource() async {
    _personalNotification = await PersonalNotificationService.getResource();

    notifyListeners();
  }
}