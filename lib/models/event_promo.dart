part of 'models.dart';

class EventPromo extends Equatable {
  final String title;
  final String imageURL;
  final String type;
  final String date;
  final List<String> content;

  EventPromo({
    this.title,
    this.imageURL,
    this.type,
    this.date,
    this.content,
  });

  @override
  List<Object> get props => [title, imageURL, type, date, content];
}