part of 'package:heaven_canceller_hospital/ui/ui.dart';

class LatestNewsScreen extends StatelessWidget {
  static String routeName = '/latest_news_screen';

  @override
  Widget build(BuildContext context) {
    final News news = ModalRoute.of(context).settings.arguments;

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
                              left: 24,
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
                            "Berita Terbaru",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 18,
                              color: darkGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// SECTION: TITLE IMAGE CONTENT
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: news.imageURL,
                          width: deviceWidth(context),
                          height: 200,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => SpinKitRing(
                            size: 50,
                            color: accentColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Foto Berita - HC Hospital",
                      textAlign: TextAlign.center,
                      style: regularBaseFont.copyWith(
                        fontSize: 11,
                        color: greyColor,
                      ),
                    ),

                    /// SECTION: DESCTION TEXT CONTENT
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: defaultMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          Text(
                            "Berita",
                            textAlign: TextAlign.start,
                            style: mediumBaseFont.copyWith(
                              color: accentColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            news.title,
                            textAlign: TextAlign.start,
                            style: semiBoldBaseFont.copyWith(
                              color: darkGreyColor,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            news.date,
                            textAlign: TextAlign.start,
                            style: regularBaseFont.copyWith(
                              color: lightGreyColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          RichText(
                            textAlign:TextAlign.start,
                            text: TextSpan(
                              children: news.content.map((text) {
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
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