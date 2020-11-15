part of 'models.dart';

///* Class Model Partner
/// Model untuk mengelola data collection partner kerja rumah sakit

class Partner extends Equatable {
  final String title;
  final String imageURL;
  final String date;
  final String type;
  final List<String> content;

  Partner({
    this.title,
    this.imageURL,
    this.date,
    this.type,
    this.content,
  });

  @override
  List<Object> get props => [title, imageURL, date, type, content];
}