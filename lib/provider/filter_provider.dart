part of 'provider.dart';

class FilterProvider extends ChangeNotifier {
  List<String> _selectedSpecialities = ["Semua"];
  List<String> _selectedGenders = ["Semua"];

  List<String> get selectedSpecialities => _selectedSpecialities;
  List<String> get selectedGenders => _selectedGenders;

  void onSelectSpeciality(String speciality) {
    if (selectedSpecialities.contains(speciality)) {
      _selectedSpecialities.remove(speciality);
    } else {
      _selectedSpecialities.add(speciality);
    }
  }

  void onSelectGender(String gender) {
    if (selectedGenders.contains(gender)) {
      _selectedGenders.remove(gender);
    } else {
      _selectedGenders.add(gender);
    }
  }
}