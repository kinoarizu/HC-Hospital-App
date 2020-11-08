part of 'package:heaven_canceller_hospital/ui/screens/screens.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /// SECTION: TITLE SEARCH BOX
          Consumer<EventPromoProvider>(
            builder: (context, eventPromos, _) => Consumer<ServiceFacilityProvider>(
              builder: (context, serviceFacilities, _) => Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Layanan",
                      style: semiBoldBaseFont.copyWith(
                        color: darkGreyColor,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SearchBoxField(
                      controller: searchController,
                      onChanged: (value) {
                        serviceFacilities.searchResource(value);
                        eventPromos.searchResource(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// SECTION: FACILITY & SERVICE SLIDER CARD
          Consumer<ServiceFacilityProvider>(
            builder: (context, provider, _) {
              if ((provider.serviceFacilities != null)) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        bottom: 16,
                      ),
                      child: Text(
                        (provider.keyword != "") ? "Hasil Pencarian Fasilitas & Layanan" : "Fasilitas & Layanan Terkini",
                        style: semiBoldBaseFont.copyWith(
                          fontSize: 16,
                          color: darkGreyColor,
                        ),
                      ),
                    ),
                    if (provider.keyword == "") Container(
                      height: 180,
                      child: ListView.builder(
                        itemCount: provider.serviceFacilities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.only(
                            left: (index == 0) ? 20 : 16,
                            right: (index == provider.serviceFacilities.length - 1) ? 20 : 0,
                          ),
                          child: HospitalFacilityCard(
                            title: provider.serviceFacilities[index].name,
                            imagePath: provider.serviceFacilities[index].imagePath,
                            onTap: () {
                              Navigator.pushNamed(context, DetailServiceScreen.routeName,
                                arguments: provider.serviceFacilities[index],
                              );
                            },
                          ),
                        ),
                      ) 
                    ) else Container(
                      height: 180,
                      child: (provider.searchedServiceFacilities.length != 0) ? ListView.builder(
                        itemCount: provider.searchedServiceFacilities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.only(
                            left: (index == 0) ? 20 : 16,
                            right: (index == provider.searchedServiceFacilities.length - 1) ? 20 : 0,
                          ),
                          child: HospitalFacilityCard(
                            title: provider.searchedServiceFacilities[index].name,
                            imagePath: provider.searchedServiceFacilities[index].imagePath,
                            onTap: () {
                              Navigator.pushNamed(context, DetailServiceScreen.routeName,
                                arguments: provider.searchedServiceFacilities[index],
                              );
                            },
                          ),
                        ),
                      ) : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/empty_state.png",
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Tidak Ada Hasil",
                              style: mediumBaseFont.copyWith(
                                color: darkGreyColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }

              /// WIDGET: LOADING MAPS RESOURCE
              return CircularLoadingState(
                height: 180,
                state: "Memuat Data Fasilitas",
              );
            },
          ),

          /// SECTION: EVENT PROMO CARD
          Consumer<EventPromoProvider>(
            builder: (context, eventPromoProvider, _) {
              if (eventPromoProvider.eventPromos != null) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (eventPromoProvider.keyword != "") ? "Hasil Pencarian Event & Promo" : "Event & Promo" ,
                        style: semiBoldBaseFont.copyWith(
                          fontSize: 16,
                          color: darkGreyColor,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      if (eventPromoProvider.keyword == "") Container(
                        height: eventPromoProvider.eventPromos.length * (220 + 16).toDouble(),
                        child: ListView.builder(
                          itemCount: eventPromoProvider.eventPromos.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => Padding(
                            padding: EdgeInsets.only(
                              bottom: 16,
                            ),
                            child: EventPromoCard(
                              eventPromoProvider.eventPromos[index],
                              onTap: () {
                                Navigator.pushNamed(context, EventPromoScreen.routeName,
                                  arguments: eventPromoProvider.eventPromos[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ) else Container(
                        height: (eventPromoProvider.searchedEventPromos.length != 0) ? eventPromoProvider.searchedEventPromos.length * (214 + 16).toDouble() : 200,
                        child: (eventPromoProvider.searchedEventPromos.length != 0) ? ListView.builder(
                          itemCount: eventPromoProvider.searchedEventPromos.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => Padding(
                            padding: EdgeInsets.only(
                              bottom: 16,
                            ),
                            child: EventPromoCard(
                              eventPromoProvider.searchedEventPromos[index],
                              onTap: () {
                                Navigator.pushNamed(context, EventPromoScreen.routeName,
                                  arguments: eventPromoProvider.searchedEventPromos[index],
                                );
                              },
                            ),
                          ),
                        ) : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/image/empty_state.png",
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Tidak Ada Hasil",
                                style: mediumBaseFont.copyWith(
                                  color: darkGreyColor,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              /// WIDGET: LOADING NEWS LISTVIEW 
              return CircularLoadingState(
                height: 262,
                state: "Memuat Event Promo",
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}