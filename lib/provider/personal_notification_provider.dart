part of 'provider.dart';

class PersonalNotificationProvider extends ChangeNotifier {
  List<PersonalNotification> _personalNotification;

  List<PersonalNotification> get personalNotification => _personalNotification;

  void loadResource() async {
    _personalNotification = await PersonalNotificationService.getResource();

    notifyListeners();
  }
}