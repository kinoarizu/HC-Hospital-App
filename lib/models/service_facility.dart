part of 'models.dart';

///* Class Model ServiceFacility
/// Model untuk mengelola data collection layanan dan fasilitas rumah sakit

class ServiceFacility extends Equatable {
  final String name;
  final String type;
  final String imagePath;
  final List<String> content;

  ServiceFacility({
    this.name,
    this.type, 
    this.imagePath,
    this.content,
  });

  @override
  List<Object> get props => [name, type, imagePath, content];
}