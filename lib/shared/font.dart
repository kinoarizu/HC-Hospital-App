part of 'shared.dart';

///* Font Style

/// Berisi semua variabel berisi font style yang telah diatur [fontFamily] serta
/// [color], dan dibuat berdasarkan [fontWeight] masing-masing agar penggunaan 
/// font style bisa dioverride, reuseable dan menjadi global access.

TextStyle lightBaseFont = TextStyle(
  fontFamily: 'Poppins',
  color: darkGreyColor,
  fontWeight: FontWeight.w300,
);

TextStyle regularBaseFont = TextStyle(
  fontFamily: 'Poppins',
  color: darkGreyColor,
  fontWeight: FontWeight.w400,
);

TextStyle mediumBaseFont = TextStyle(
  fontFamily: 'Poppins',
  color: darkGreyColor,
  fontWeight: FontWeight.w500,
);

TextStyle semiBoldBaseFont = TextStyle(
  fontFamily: 'Poppins',
  color: darkGreyColor,
  fontWeight: FontWeight.w600,
);

TextStyle boldBaseFont = TextStyle(
  fontFamily: 'Poppins',
  color: darkGreyColor,
  fontWeight: FontWeight.w700,
);