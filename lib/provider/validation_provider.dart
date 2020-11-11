part of 'provider.dart';

class ValidationProvider extends ChangeNotifier {
  String _errorName;
  String _errorEmail;
  String _errorPhoneNumber;

  String get errorName => _errorName;
  String get errorEmail => _errorEmail;
  String get errorPhoneNumber => _errorPhoneNumber;

  void changeName(String value) {
    if (value.length == 0) {
      _errorName = "Nama Pasien Harus Diisi";
    } 
    else {
      _errorName = "";
    }

    notifyListeners();
  }

  void changeEmail(String value) {
    if (value.length == 0) {
      _errorEmail = "Email Harus Diisi";
    }
    else if (EmailValidator.validate(value) == false) {
      _errorEmail = "Email Harus Valid";
    }
    else {
      _errorEmail = "";
    }

    notifyListeners();
  }

  void changePhoneNumber(String value) {
    if (value.length == 0) {
      _errorPhoneNumber = "No Handphone Harus Diisi";
    }
    else if (value.length < 9) {
      _errorPhoneNumber = "Minimal 9 Karakter";
    }
    else if (value.length > 15) {
      _errorPhoneNumber = "Maksimal 15 Karakter";
    }
    else {
      _errorPhoneNumber = "";
    }

    notifyListeners();
  }

    bool isAllValidate() {
    if (_errorName == "" && _errorEmail == "" && _errorPhoneNumber == "") {
      return true;
    }
    else {
      return false;
    }
  }

  void resetChange() {
    _errorName = null;
    _errorEmail = null;
    _errorPhoneNumber = null;

    notifyListeners();
  }
}