part of 'provider.dart';

////* Class Provider Navigation
/// Class untuk menghandle state data navigasi halaman 

class NavigationProvider extends ChangeNotifier {
  int _index = 0;
  PageController _pageIndex = PageController(initialPage: 0);

  int get index => _index;
  PageController get pageIndex => _pageIndex;

  /// Mengganti index navigasi halaman utama
  void changeIndex(int index, {int initialPage = 0}) {
    _index = index;
    _pageIndex.jumpToPage(index);
    _pageIndex = PageController(initialPage: initialPage);

    notifyListeners();
  }
}