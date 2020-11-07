part of 'services.dart';

class NewsService {
  static CollectionReference _newsCollection = FirebaseFirestore.instance.collection('news');

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