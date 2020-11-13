part of 'provider.dart';

class PatientProvider extends ChangeNotifier {
  int _patientIndex = 0;

  int get patientIndex => _patientIndex;

  void changeIndex(int index) {
    _patientIndex = index;

    notifyListeners();
  }
}