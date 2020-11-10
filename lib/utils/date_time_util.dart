part of 'utils.dart';

class DateTimeUtil {
  static int generateValidDayName(String dayName) {
    switch (dayName) {
      case 'Senin':
        return 1;
      case 'Selasa':
        return 2;
      case 'Rabu':
        return 3;
      case 'Kamis':
        return 4;
      default:
        return 5;
    }
  }
}