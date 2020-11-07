part of 'provider.dart';

class NewsProvider extends ChangeNotifier {
  List<News> _news;

  List<News> get news => _news;

  void loadResource() async {
    _news = await NewsService.getResource();

    notifyListeners();
  }
}