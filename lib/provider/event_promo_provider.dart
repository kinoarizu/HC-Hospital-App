part of 'provider.dart';

///* Class Provider EventPromo
/// Class untuk menghandle state data event dan promo 

class EventPromoProvider extends ChangeNotifier {
  String _keyword = "";
  List<EventPromo> _eventPromos;
  List<EventPromo> _searchedEventPromos;

  String get keyword => _keyword;
  List<EventPromo> get eventPromos => _eventPromos;
  List<EventPromo> get searchedEventPromos => _searchedEventPromos;

  /// Memuat data event dan promo dari event promo service firebase
  void loadResource() async {
    _eventPromos = await EventPromoService.getResource();

    notifyListeners();
  }

  /// Mencari data event dan promo berdasarkan nama dari list event promo yang sudah dimuat
  void searchResource(String query) async {
    _keyword = query;
    _searchedEventPromos = eventPromos.where((element) => element.title.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  /// Mereset kata kunci pencarian
  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}