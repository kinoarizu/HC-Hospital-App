part of 'provider.dart';

///* Class Provider Doctor
/// Class untuk menghandle state data dokter 

class DoctorProvider extends ChangeNotifier {
  String _keyword = "";
  List<Doctor> _doctors;
  List<Doctor> _searchedDoctors;

  String get keyword => _keyword;
  List<Doctor> get doctors => _doctors;
  List<Doctor> get searchedDoctors => _searchedDoctors;

  /// Memuat data dokter dari doctor service firebase
  void loadResource() async {
    _doctors = await DoctorService.getResource();

    notifyListeners();
  }

  /// Mencari data dokter berdasarkan nama dari list dokter yang sudah dimuat
  void searchResource(String query) async {
    _keyword = query;
    _searchedDoctors = doctors.where((element) => element.name.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  /// Mereset kata kunci pencarian
  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}