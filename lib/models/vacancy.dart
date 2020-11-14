part of 'models.dart';

class Vacancy extends Equatable {
  final String title;
  final String imageURL;
  final String link;
  final List<String> content;

  Vacancy({
    this.title,
    this.imageURL,
    this.link,
    this.content,
  });

  @override
  List<Object> get props => [title, imageURL, link, content];
}