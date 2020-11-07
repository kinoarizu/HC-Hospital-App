part of 'models.dart';

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