part of 'provider.dart';

class DoctorProvider extends ChangeNotifier {
  List<Doctor> _doctors;

  List<Doctor> get doctors => _doctors;

  void loadResource() async {
    _doctors = await DoctorService.getResource();

    notifyListeners();
  }
}