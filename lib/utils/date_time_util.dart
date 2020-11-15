part of 'utils.dart';

///* DateTime Utility Class - DateTime Custom Configuration
/// Class ini dibuat agar dapat membungkus method utilitas waktu dan tanggal

class DateTimeUtil {
  /// Mengenerate hari kerja dokter (senin - jum'at) dalam angka urutan hari
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

  /// Mengenerate waktu perbedaan (yang lalu) berdasarkan waktu epoch (unix time)
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