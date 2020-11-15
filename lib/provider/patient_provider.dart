part of 'provider.dart';

///* Class Provider Patient
/// Class untuk menghandle state data pasien 

class PatientProvider extends ChangeNotifier {
  int _patientIndex = 0;

  int get patientIndex => _patientIndex;

  /// Merubah pasien yang dipilih untuk booking dokter
  void changeIndex(int index) {
    _patientIndex = index;

    notifyListeners();
  }
}