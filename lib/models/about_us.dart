part of 'models.dart';

///* Class Model AboutUs
/// Model untuk mengelola data collection tentang rumah sakit

class AboutUs extends Equatable {
  final List<String> content;
  final String imagePath;

  AboutUs({
    this.content,
    this.imagePath,
  });

  @override
  List<Object> get props => [content, imagePath];
}