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

  static String generateDiffHuman(int epoch) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch);

    int hour = dateTime.difference(DateTime.now()).inHours;
    int day = dateTime.difference(DateTime.now()).inDays;

    if (hour < 1) {
      return "Baru Saja";
    } 
    else if (hour > 1 && hour < 23) {
      return "${hour.toString()} Jam Yang Lalu";
    }
    else {
      return "${day.toString()} Hari Yang Lalu";
    }
  }
}