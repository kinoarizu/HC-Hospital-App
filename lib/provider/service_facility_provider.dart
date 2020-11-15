part of 'provider.dart';

///* Class Provider ServiceFacility
/// Class untuk menghandle state data fasilitas dan layanan 

class ServiceFacilityProvider extends ChangeNotifier {
  String _keyword = "";
  List<ServiceFacility> _serviceFacilities;
  List<ServiceFacility> _searchedServiceFacilities;

  String get keyword => _keyword;
  List<ServiceFacility> get serviceFacilities => _serviceFacilities;
  List<ServiceFacility> get searchedServiceFacilities => _searchedServiceFacilities;

  /// Memuat data fasilitas dan layanan dari service facility service firebase
  void loadResource() async {
    _serviceFacilities = await ServiceFacilityService.getResource();

    notifyListeners();
  }

  /// Mencari data asilitas dan layanan berdasarkan nama dari list asilitas dan layanan yang sudah dimuat
  void searchResource(String query) async {
    _keyword = query;
    _searchedServiceFacilities = serviceFacilities.where((element) => element.name.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  /// Mereset kata kunci pencarian
  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}