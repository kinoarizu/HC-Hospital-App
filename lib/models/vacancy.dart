part of 'models.dart';

class Vacancy extends Equatable {
  final String title;
  final String imageURL;
  final String date;
  final List<String> content;

  Vacancy({
    this.title,
    this.imageURL,
    this.date,
    this.content,
  });

  @override
  List<Object> get props => [title, imageURL, date, content];
}