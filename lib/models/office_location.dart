part of 'models.dart';

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