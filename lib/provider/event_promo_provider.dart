part of 'provider.dart';

class EventPromoProvider extends ChangeNotifier {
  List<EventPromo> _eventPromos;

  List<EventPromo> get eventPromos => _eventPromos;

  void loadResource() async {
    _eventPromos = await EventPromoService.getResource();

    notifyListeners();
  }
}