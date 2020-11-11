part of 'package:heaven_canceller_hospital/ui/ui.dart';

///* Bottom Navbar Widget

/// Class ini berguna untuk menampilkan widget navigasi yang sudah 
/// saya buat menggunakan widget bawaan [BottomNavigationBar], yang 
/// kemudian saya custom tampilannya sesuai design agar bisa 
/// melakukan navigasi halaman antar fitur di aplikasi ini.

class BottomNavbar extends StatelessWidget {
  final BuildContext context;

  BottomNavbar(this.context);

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation = Provider.of<NavigationProvider>(context, listen: false);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: baseColor,
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.12),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: navigation.index,
          type: BottomNavigationBarType.fixed, 
          onTap: (index) {
            navigation.changeIndex(index);
            Provider.of<EventPromoProvider>(context, listen: false).resetKeyword();
            Provider.of<ServiceFacilityProvider>(context, listen: false).resetKeyword();
            Provider.of<DoctorProvider>(context, listen: false).resetKeyword();
          },
          selectedLabelStyle: mediumBaseFont.copyWith(
            color: accentColor,
            fontSize: 10,
          ),
          unselectedLabelStyle: mediumBaseFont.copyWith(
            color: navInactiveColor,
            fontSize: 10,
          ),
          items: [
            _buildBottomNavBarItem(
              label: "Home",
              icon: "assets/image/ic_home.png",
              activeIcon: "assets/image/ic_home_active.png",
            ),
            _buildBottomNavBarItem(
              label: "Layanan",
              icon: "assets/image/ic_layanan.png",
              activeIcon: "assets/image/ic_layanan_active.png",
            ),
            _buildBottomNavBarItem(
              label: "Booking",
              icon: "assets/image/ic_booking.png",
              activeIcon: "assets/image/ic_booking_active.png",
            ),
            _buildBottomNavBarItem(
              label: "Profile",
              icon: "assets/image/ic_profile.png",
              activeIcon: "assets/image/ic_profile_active.png",
            ),
            _buildBottomNavBarItem(
              label: "More",
              icon: "assets/image/ic_more.png",
              activeIcon: "assets/image/ic_more_active.png",
            ),
          ],
        ),
      ),
    );
  }
}

///* Function Build Bottom NavBar Item

/// Function ini dibuat untuk men-generate [BottomNavigationBarItem] 
/// yang digunakan untuk menampilakan item navigasi setiap fitur. supaya 
/// tidak membuat kode berulang maka dibuat function ini agar saya tinggal 
/// memasukan [label], [icon], dan [activeIcon] setiap pemanggilan.

BottomNavigationBarItem _buildBottomNavBarItem({String label, String icon, String activeIcon}) {
  return BottomNavigationBarItem(
    label: label,
    icon: Container(
      height: 24,
      margin: EdgeInsets.only(bottom: 6),
      child: Image.asset(
        icon,
      ),
    ),
    activeIcon: Container(
      height: 24,
      margin: EdgeInsets.only(bottom: 6),
      child: Image.asset(
        activeIcon,
      ),
    ),
  );
}