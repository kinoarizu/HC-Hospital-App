part of 'provider.dart';

class BookingProvider extends ChangeNotifier {
  List<Booking> _bookings;

  List<Booking> get bookings => _bookings;

  void loadResource() async {
    _bookings = await BookingService.getResource();

    notifyListeners();
  }
}