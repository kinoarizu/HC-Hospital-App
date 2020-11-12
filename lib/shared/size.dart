part of 'shared.dart';

///* Media Size

/// Berisi function yang dibutuhkan untuk mendapatkan ukuran dimensi
/// device yang digunakan user agar penggunaannya bisa menjadi reuseable.

// Mengatur margin default untuk layar device
const double defaultMargin = 20;

// Mendapatkan lebar layar setiap perangkat pengguna
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

// Mendapatkan tinggi layar setiap perangkat pengguna
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

// Mengatur lebar default yang didapat dari lebar layar dikurangi default margin
double defaultWidth(BuildContext context) => deviceWidth(context) - 2 * defaultMargin;

// Mendapatkan tinggi status bar setiap perangkat pengguna
double statusBarHeight(BuildContext context) => MediaQuery.of(context).padding.top;

// Mendapatkan status posisi orientasi layar setiap pengguna
Orientation getOrientation(BuildContext context) => MediaQuery.of(context).orientation;