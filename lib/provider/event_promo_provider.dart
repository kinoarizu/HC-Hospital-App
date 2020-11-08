part of 'provider.dart';

class EventPromoProvider extends ChangeNotifier {
  String _keyword = "";
  List<EventPromo> _eventPromos;
  List<EventPromo> _searchedEventPromos;

  String get keyword => _keyword;
  List<EventPromo> get eventPromos => _eventPromos;
  List<EventPromo> get searchedEventPromos => _searchedEventPromos;

  void loadResource() async {
    _eventPromos = await EventPromoService.getResource();

    notifyListeners();
  }

  void searchResource(String query) async {
    _keyword = query;
    _searchedEventPromos = eventPromos.where((element) => element.title.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}