part of 'models.dart';

///* Class Model OfficeLocation
/// Model untuk mengelola data collection kontak menghubungi rumah sakit

class OfficeLocation extends Equatable {
  final String placeName;
  final String address;
  final String regularSchedule;
  final String weekendSchedule;
  final String imagePath;
  final String mapImage;

  OfficeLocation({
    this.placeName, 
    this.address, 
    this.regularSchedule, 
    this.weekendSchedule, 
    this.imagePath,
    this.mapImage,
  });
  
  @override
  List<Object> get props => [placeName, address, regularSchedule, weekendSchedule, imagePath, mapImage];
}