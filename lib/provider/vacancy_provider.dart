part of 'provider.dart';

///* Class Provider Vancancy
/// Class untuk menghandle state data lowongan kerja 

class VacancyProvider extends ChangeNotifier {
  String _keyword = "";
  List<Vacancy> _vacancies;
  List<Vacancy> _searchedVacancies;

  String get keyword => _keyword;
  List<Vacancy> get vacancies => _vacancies;
  List<Vacancy> get searchedVacancies => _searchedVacancies;

  /// Memuat data lowngan dari vacancy service firebase
  void loadResource() async {
    _vacancies = await VacancyService.getResource();

    notifyListeners();
  }

  /// Mencari data lowongan berdasarkan nama dari list lowongan yang sudah dimuat
  void searchResource(String query) async {
    _keyword = query;
    _searchedVacancies = vacancies.where((element) => element.title.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  /// Mereset kata kunci pencarian
  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}