part of 'models.dart';

class Partner extends Equatable {
  final String title;
  final String imageURL;

  Partner({
    this.title,
    this.imageURL,
  });

  @override
  List<Object> get props => [title, imageURL];
}