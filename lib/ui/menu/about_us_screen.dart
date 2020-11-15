part of 'package:heaven_canceller_hospital/ui/ui.dart';

class AboutUsScreen extends StatelessWidget {
  static String routeName = '/about_us_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: accentColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: baseColor,
                ),
                ListView(
                  children: [
                    /// SECTION: TITLE BACK BUTTON
                    SizedBox(
                      height: 24,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: GestureDetector(
                              child: Icon(
                                Icons.arrow_back,
                                color: darkGreyColor,
                                size: 28,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Align(  
                          alignment: Alignment.center,
                          child: Text(
                            "Tentang Kami",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 18,
                              color: darkGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    StreamBuilder(
                      stream: AboutUsService.getSingle(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                snapshot.data['image_path'],
                                width: defaultWidth(context),
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }

                        /// WIDGET: LOADING DESCRIPTION
                        return CircularLoadingState(
                          height: 240,
                          state: "Memuat Gambar",
                        );
                      }
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: defaultMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Seputar Tentang Heaven Canceller Hospital",
                            textAlign: TextAlign.start,
                            style: semiBoldBaseFont.copyWith(
                              color: accentColor,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          StreamBuilder(
                            stream: AboutUsService.getSingle(),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                List<String> content = (snapshot.data['content'] as List).map((e) => e.toString()).toList();
                                return RichText(
                                  textAlign:TextAlign.start,
                                  text: TextSpan(
                                    children: content.map((text) {
                                      return WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          child: Text(
                                            text,
                                            style: regularBaseFont.copyWith(
                                              fontSize: 12,
                                              height: 1.7,
                                              color: darkGreyColor,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              }

                              /// WIDGET: LOADING DESCRIPTION
                              return CircularLoadingState(
                                height: 240,
                                state: "Memuat Deskripsi",
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: FutureBuilder(
                        future: HospitalContactService.getResource(),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              height: 520,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (_, index) {
                                  HospitalContact hospitalContacts = snapshot.data[index];
                                  return AboutUsCard(
                                    hospitalContacts,
                                  );
                                },
                              ),
                            );
                          }

                          /// WIDGET: LOADING CONTACT DATA
                          return CircularLoadingState(
                            height: 240,
                            state: "Memuat Data Info",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}