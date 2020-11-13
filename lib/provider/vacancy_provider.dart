part of 'provider.dart';

class VacancyProvider extends ChangeNotifier {
  String _keyword = "";
  List<Vacancy> _vacancies;
  List<Vacancy> _searchedVacancies;

  String get keyword => _keyword;
  List<Vacancy> get vacancies => _vacancies;
  List<Vacancy> get searchedVacancies => _searchedVacancies;

  void loadResource() async {
    _vacancies = await VacancyService.getResource();

    notifyListeners();
  }

  void searchResource(String query) async {
    _keyword = query;
    _searchedVacancies = vacancies.where((element) => element.title.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}