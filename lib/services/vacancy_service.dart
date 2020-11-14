part of 'services.dart';

class VacancyService {
  static CollectionReference _vacancyCollection = FirebaseFirestore.instance.collection('vacancies');

  static Future<List<Vacancy>> getResource() async {
    QuerySnapshot snapshot = await _vacancyCollection.get();

    List<Vacancy> vacancies = [];

    for (var document in snapshot.docs) {
      vacancies.add(
        Vacancy(
          title: document.data()['title'],
          imageURL: document.data()['image_url'],
          link: document.data()['link'],
          content: (document.data()['content'] as List).map((e) => e.toString()).toList(),
        ),
      );
    }

    return vacancies;
  }
}