part of 'services.dart';

///* Class Service News
/// Class untuk menghandle resource berita kesehatan

class NewsService {
  static CollectionReference _newsCollection = FirebaseFirestore.instance.collection('news');

  /// Melakukan fetch semua data berita kesehatan
  static Future<List<News>> getResource() async {
    QuerySnapshot snapshot = await _newsCollection.get();

    List<News> news = [];

    for (var document in snapshot.docs) {
      news.add(
        News(
          title: document.data()['title'],
          content: (document.data()['content'] as List).map((e) => e.toString()).toList(),
          imageURL: document.data()['image_url'],
          date: document.data()['date'],
        ),
      );
    }

    return news;
  }
}