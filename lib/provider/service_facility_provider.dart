part of 'provider.dart';

class ServiceFacilityProvider extends ChangeNotifier {
  String _keyword = "";
  List<ServiceFacility> _serviceFacilities;
  List<ServiceFacility> _searchedServiceFacilities;

  String get keyword => _keyword;
  List<ServiceFacility> get serviceFacilities => _serviceFacilities;
  List<ServiceFacility> get searchedServiceFacilities => _searchedServiceFacilities;

  void loadResource() async {
    _serviceFacilities = await ServiceFacilityService.getResource();

    notifyListeners();
  }

  void searchResource(String query) async {
    _keyword = query;
    _searchedServiceFacilities = serviceFacilities.where((element) => element.name.toLowerCase().contains(keyword)).toList();

    notifyListeners();
  }

  void resetKeyword() {
    _keyword = "";

    notifyListeners();
  }
}