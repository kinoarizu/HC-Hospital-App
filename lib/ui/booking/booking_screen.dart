part of 'package:heaven_canceller_hospital/ui/ui.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// SECTION: TITLE SEARCH FILTER BOX
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/image/ic_booking_black.png",
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Booking",
                    style: semiBoldBaseFont.copyWith(
                      color: darkGreyColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<DoctorProvider>(
                    builder: (context, provider, _) => Flexible(
                      flex: 5,
                      child: SearchBoxField(
                        hintText: "Cari dokter pilihan anda",
                        onChanged: (value) {
                          provider.searchResource(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),

              /// SECTION: DOCTOR GRIDVIEW
              Consumer<DoctorProvider>(
                builder: (context, provider, _) {
                  int doctorsLength = provider.doctors.length;

                  if (provider.keyword == "") {
                    return SizedBox(
                      height: (getOrientation(context) == Orientation.portrait) ? 910 : 480,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (getOrientation(context) == Orientation.portrait) ? 2 : 4,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: (getOrientation(context) == Orientation.portrait) ? 3 / 4 : 2.75 / 4,
                        ),
                        itemCount: doctorsLength,
                        itemBuilder: (_, index) {
                          return DoctorViewCard(
                            provider.doctors[index],
                            onTap: () {
                              Navigator.pushNamed(context, DetailDoctorScreen.routeName,
                                arguments: provider.doctors[index],
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    if (provider.searchedDoctors.length != 0) {
                      return SizedBox(
                        height: (getOrientation(context) == Orientation.portrait) ? (provider.searchedDoctors.length >= 2) ? 910 : 250 : (provider.searchedDoctors.length >= 2) ? 480 : 260,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (getOrientation(context) == Orientation.portrait) ? 2 : 4,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: (getOrientation(context) == Orientation.portrait) ? 3 / 4 : 2.75 / 4,
                          ),
                          itemCount: provider.searchedDoctors.length ,
                          itemBuilder: (_, index) {
                            return DoctorViewCard(
                              provider.searchedDoctors[index],
                              onTap: () {
                                Navigator.pushNamed(context, DetailDoctorScreen.routeName,
                                  arguments: provider.searchedDoctors[index],
                                );
                              },
                            );
                          },
                        ),
                      );
                    }
                    
                    /// SECTION: EMPTY VIEW STATE
                    return Container(
                      height: 360,
                      child: EmptyViewState(),
                    );
                  }
                },
              ), 
            ],
          ),
        ),
      ),
    );
  }
}