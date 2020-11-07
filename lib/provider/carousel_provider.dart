part of 'provider.dart';

///* Carousel Provider

/// Class yang digunakan untuk mengatur urutan state image carousel yang ditampilkan 
/// pada home screen menggunakan state management provider melalui class [ChangeNotifier].

class CarouselProvider extends ChangeNotifier {
  int _current = 0;

  int get current => _current;

  void changeIndex(int index) {
    _current = index;

    notifyListeners();
  }
}