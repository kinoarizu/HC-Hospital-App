part of 'models.dart';

///* Class Model News
/// Model untuk mengelola data collection berita seputar dunia kesehatan

class News extends Equatable {
  final String title;
  final String imageURL;
  final String date;
  final List<String> content;

  News({
    this.title,
    this.imageURL,
    this.date,
    this.content,
  });

  @override
  List<Object> get props => [title, imageURL, date, content];
}