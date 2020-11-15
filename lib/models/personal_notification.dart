part of 'models.dart';

///* Class Model PersonalNotification
/// Model untuk mengelola data collection notifikasi pengguna aplikasi ini

class PersonalNotification extends Equatable {
  final String title;
  final String subtitle;
  final String imagePath;
  final String type;
  final String content;
  final int time;

  PersonalNotification({
    this.title, 
    this.subtitle, 
    this.imagePath, 
    this.type, 
    this.content, 
    this.time,
  });

  @override
  List<Object> get props => [title, subtitle, imagePath, type, content, time];
}