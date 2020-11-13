part of 'provider.dart';

class DoctorProvider extends ChangeNotifier {
  String _keyword = "";
  List<Doctor> _doctors;
  List<Doctor> _searchedDoctors;

  String get keyword => _keyword;
  List<Doctor> get doctors => _doctors;
  List<Doctor> get searchedDoctors => _searchedDoctors;

  void loadResource() async {
    _doctors = await DoctorService.getResource();

    notifyListeners();
  }

  void searchResource(String query) async {
    _keyword = query;
    _searchedDoctors = doctors.where((element) => element.name.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}