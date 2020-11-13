part of 'package:heaven_canceller_hospital/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarouselProvider carousel = Provider.of<CarouselProvider>(context);

    return Scaffold(
      body: ListView(
        children: [
          /// SECTION: EVENT PROMO CAROUSEL
          Consumer<EventPromoProvider>(
            builder: (context, eventPromoProvider, _) {
              if (eventPromoProvider.eventPromos != null) {
                return Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: eventPromoProvider.eventPromos.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 6),
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        enableInfiniteScroll: true,
                        height: 270 - statusBarHeight(context),
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          carousel.changeIndex(index);
                        },
                      ),
                      itemBuilder: (_, index) => GestureDetector(
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: eventPromoProvider.eventPromos[index].imageURL,
                                  fit: BoxFit.cover,
                                  height: 250 - statusBarHeight(context),
                                  width: deviceWidth(context),
                                  placeholder: (context, url) => SpinKitRing(
                                    color: accentColor,
                                    size: 50,
                                  ),
                                ),
                                Container(
                                  height: 250 - statusBarHeight(context),
                                  decoration: BoxDecoration(
                                    color: blackColor.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 250 - statusBarHeight(context),
                              width: deviceWidth(context),
                              padding: EdgeInsets.only(
                                top: 36,
                                bottom: 16,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eventPromoProvider.eventPromos[index].title,
                                    style: semiBoldBaseFont.copyWith(
                                      color: baseColor,
                                      fontSize: 24,
                                      height: 1.2,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3,
                                          color: blackColor.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    eventPromoProvider.eventPromos[index].content[0],
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: regularBaseFont.copyWith(
                                      color: baseColor,
                                      fontSize: 12,
                                      height: 1.5,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 2,
                                          color: blackColor.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CarouselIndicator(
                                        eventPromoProvider.eventPromos.map((e) {
                                          return e.imageURL;
                                        }).toList(),
                                      ),
                                      AccentRaisedButton(
                                        height: 20,
                                        borderRadius: 12,
                                        color: accentColor,
                                        text: "Read",
                                        fontSize: 12,
                                        onPressed: () {
                                          Navigator.pushNamed(context, EventPromoScreen.routeName,
                                            arguments: eventPromoProvider.eventPromos[index],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, EventPromoScreen.routeName,
                            arguments: eventPromoProvider.eventPromos[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              
              /// WIDGET: LOADING CAROUSEL RESOURCE
              return CircularLoadingState(
                height: 270 - statusBarHeight(context),
                state: "Memuat Event Promo",
              );
            },
          ),

          /// SECTION: MAPS TEMUKAN KAMI
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temukan Kami",
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 18,
                    color: blackColor.withOpacity(0.8),
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                StreamBuilder(
                  stream: OfficeLocationService.getSingle(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        child: Container(
                          width: defaultWidth(context),
                          height: 160,
                          margin: EdgeInsets.only(
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFCCCCCC),
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                spreadRadius: -5,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: MapViewCard(
                                  latitude: snapshot.data['latitude'],
                                  longitude: snapshot.data['longitude'],
                                ),
                              ),
                              MapAddressCard(
                                placeName: snapshot.data['place_name'],
                                address: snapshot.data['address'],
                                image: snapshot.data['map_image'],
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          if (await mapLauncher.MapLauncher.isMapAvailable(mapLauncher.MapType.google)) {
                            await mapLauncher.MapLauncher.showMarker(
                              mapType: mapLauncher.MapType.google,
                              coords: mapLauncher.Coords(snapshot.data['latitude'], snapshot.data['longitude']),
                              title: snapshot.data['address'],
                            );
                          }
                        },
                      );
                    }

                    /// WIDGET: LOADING MAPS RESOURCE
                    return CircularLoadingState(
                      height: 160,
                      state: "Memuat Alamat Peta",
                    );
                  }
                ),
                FutureBuilder(
                  future: OfficeLocationService.getResource(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 360,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            OfficeLocation officeLocation = snapshot.data[index];
                            return HospitalInfoCard(
                              placeName: officeLocation.placeName,
                              address: officeLocation.address,
                              regularSchedule: officeLocation.regularSchedule,
                              weekendSchedule: officeLocation.weekendSchedule,
                              image: officeLocation.imagePath,
                            );
                          }
                        ),
                      );
                    }

                    /// WIDGET: LOADING LOKASI KANTOR
                    return CircularLoadingState(
                      height: 160,
                      state: "Memuat Data Alamat",
                    );
                  },
                ),
              ],
            ),
          ),

          /// SECTION: LISTVIEW TENTANG KAMI 
          Container(
            color: accentColor,
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tentang Kami",
                        style: semiBoldBaseFont.copyWith(
                          fontSize: 18,
                          color: baseColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "Selengkapnya",
                          style: regularBaseFont.copyWith(
                            fontSize: 11.5,
                            color: baseColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, AboutUsScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                StreamBuilder(
                  stream: AboutUsService.getSingle(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        child: Container(
                          width: defaultWidth(context),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                snapshot.data['image_path'],
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: blackColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 120,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tentang Kami",
                                        style: semiBoldBaseFont.copyWith(
                                          fontSize: 16,
                                          color: baseColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        snapshot.data['content'][0],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: regularBaseFont.copyWith(
                                          fontSize: 12,
                                          color: baseColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, AboutUsScreen.routeName);
                        },
                      );
                    }

                    /// WIDGET: LOADING ABOUT US
                    return CircularLoadingState(
                      height: 200,
                      state: "Memuat Tentang Kami",
                      color: baseColor,
                      fontColor: baseColor,
                    );
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dokter Kami",
                        style: semiBoldBaseFont.copyWith(
                          fontSize: 18,
                          color: baseColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "Lihat Lainya",
                          style: regularBaseFont.copyWith(
                            fontSize: 11.5,
                            color: baseColor,
                          ),
                        ),
                        onTap: () {
                          Provider.of<NavigationProvider>(context, listen: false).changeIndex(2);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 196,
                  child: Consumer<DoctorProvider>(
                    builder: (context, doctorProvider, _) {
                      if (doctorProvider.doctors != null) {
                        return ListView.builder(
                          itemCount: doctorProvider.doctors.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: (index == doctorProvider.doctors.length - 1) ? 16 : 20,
                                left: (index == 0) ? 20 : 0,
                              ),
                              child: DoctorProfileCard(
                                doctorProvider.doctors[index],
                                onTap: () {
                                  Navigator.pushNamed(context, DetailDoctorScreen.routeName,
                                    arguments: doctorProvider.doctors[index],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }
                      
                      /// WIDGET: LOADING DOCTOR LISTVIEW 
                      return CircularLoadingState(
                        height: 196,
                        state: "Memuat Data Dokter",
                        color: baseColor,
                        fontColor: baseColor,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),

          /// SECTION: BERITA TERBARU LISTVIEW
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  "Berita Terbaru",
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 18,
                    color: blackColor.withOpacity(0.8),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Container(
                height: 262,
                child: Consumer<NewsProvider>(
                  builder: (context, newsProvider, _) {
                    if (newsProvider.news != null) {
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: newsProvider.news.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: (index == newsProvider.news.length - 1) ? 16 : 20,
                              left: (index == 0) ? 20 : 0,
                            ),
                            child: LatestNewsCard(
                              newsProvider.news[index],
                              onTap: () {
                                Navigator.pushNamed(context, LatestNewsScreen.routeName,
                                  arguments: newsProvider.news[index],
                                );
                              },
                            ),
                          );
                        },
                      );
                    }

                    /// WIDGET: LOADING NEWS LISTVIEW 
                    return CircularLoadingState(
                      height: 262,
                      state: "Memuat Data Berita",
                    );
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),

          /// SECTION: CONTACT US CARD
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  "Kontak & Pengaduan",
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 18,
                    color: blackColor.withOpacity(0.8),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: FutureBuilder(
                  future: ContactComplaintService.getResource(),
                  builder: (_, snapshot) {
                    List<ContactComplaint> contactComplaint = snapshot.data;

                    if (snapshot.hasData) {
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: contactComplaint.map((data) {
                          return ContactComplaintCard(
                            content: data.contact,
                            icon: data.iconPath,
                            onTap: () {
                              launch(data.launcher);
                            },
                          );
                        }).toList(),
                      );
                    }

                    /// WIDGET: LOADING CONTACT COMPLAINT CARD
                    return CircularLoadingState(
                      height: 262,
                      state: "Memuat Data Kontak",
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}