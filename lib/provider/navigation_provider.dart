part of 'provider.dart';

///* Validation Provider

/// Class yang digunakan untuk mengatur state navigasi bottom navbar 
/// menggunakan state management provider melalui class [ChangeNotifier].

class NavigationProvider extends ChangeNotifier {
  int _index = 0;
  PageController _pageIndex = PageController(initialPage: 0);

  int get index => _index;
  PageController get pageIndex => _pageIndex;

  void changeIndex(int index) {
    _index = index;
    _pageIndex.jumpToPage(index);

    notifyListeners();
  }
}