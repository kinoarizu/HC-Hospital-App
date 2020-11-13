part of 'package:heaven_canceller_hospital/ui/ui.dart';

class PartnerCareerScreen extends StatelessWidget {
  static String routeName = '/partner_career_screen';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Provider.of<DoctorProvider>(context, listen: false).resetKeyword();
        return;
      },
      child: Scaffold(
        body: ListView(
          children: [
            /// SECTION: TITLE SEARCH BOX
            Consumer<VacancyProvider>(
              builder: (context, vacancies, _) => Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: 24,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              vacancies.resetKeyword();
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Partner Kerja",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 24,
                              color: darkGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),    
                    SizedBox(
                      height: 24,
                    ),
                    SearchBoxField(
                      hintText: "Cari lowongan",
                      onChanged: (value) {
                        vacancies.searchResource(value);
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// SECTION: PARTNER SLIDER CARD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: 16,
                  ),
                  child: Text(
                    "Partner Kerja",
                    style: semiBoldBaseFont.copyWith(
                      fontSize: 16,
                      color: darkGreyColor,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: PartnerService.getResource(),
                  builder: (_, snapshot) {
                    List<Partner> partners = snapshot.data;
                    return Container(
                      height: 120,
                      child: ListView.builder(
                        itemCount: partners.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.only(
                            left: (index == 0) ? 20 : 16,
                            right: (index == 2) ? 20 : 0,
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color: lightGreyColor,
                              ),
                            ),
                            child: Center(
                              child: CachedNetworkImage(
                                imageUrl: partners[index].imageURL,
                                placeholder: (_, url) => SpinKitRing(
                                  color: accentColor,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),

            /// SECTION: VACANCY JOBS CARD
            Consumer<VacancyProvider>(
              builder: (context, vacancyProvider, _) {
                if (vacancyProvider.vacancies != null) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (vacancyProvider.keyword != "") ? "Hasil Pencarian Lowongan" : "Lowongan" ,
                          style: semiBoldBaseFont.copyWith(
                            fontSize: 16,
                            color: darkGreyColor,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        if (vacancyProvider.keyword == "") Container(
                          height: vacancyProvider.vacancies.length * (215 + 16).toDouble(),
                          child: ListView.builder(
                            itemCount: vacancyProvider.vacancies.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: VacancyJobCard(
                                vacancyProvider.vacancies[index],
                                onTap: () {},
                              ),
                            ),
                          ),
                        ) else Container(
                          height: (vacancyProvider.searchedVacancies.length != 0) ? vacancyProvider.searchedVacancies.length * (214 + 16).toDouble() : 200,
                          child: (vacancyProvider.searchedVacancies.length != 0) ? ListView.builder(
                            itemCount: vacancyProvider.searchedVacancies.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: VacancyJobCard(
                                vacancyProvider.searchedVacancies[index],
                                onTap: () {},
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

                /// WIDGET: LOADING VACANCY LISTVIEW 
                return CircularLoadingState(
                  height: 262,
                  state: "Memuat Lowongan",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}