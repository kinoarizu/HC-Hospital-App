part of 'provider.dart';

///* Class Provider Carousel
/// Class untuk menghandle state udata event promo carousel

class CarouselProvider extends ChangeNotifier {
  int _current = 0;

  int get current => _current;

  /// Mengganti urutan berdasarkan angka index setiap element
  void changeIndex(int index) {
    _current = index;

    notifyListeners();
  }
}