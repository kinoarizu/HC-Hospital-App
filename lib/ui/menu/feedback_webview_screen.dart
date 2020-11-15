part of 'package:heaven_canceller_hospital/ui/ui.dart';

class FeedbackWebviewScreen extends StatefulWidget {
  static String routeName = '/feedback_webview_screen';

  @override
  _FeedbackWebviewScreenState createState() => _FeedbackWebviewScreenState();
}

class _FeedbackWebviewScreenState extends State<FeedbackWebviewScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

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
                Column(
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
                            "Feedback",
                            style: semiBoldBaseFont.copyWith(
                              color: darkGreyColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),

                    /// SECTION: WEBVIEW FORM CONTENT
                    Expanded(
                      child: Container(
                        width: deviceWidth(context),
                        height: double.infinity,
                        child: WebView(
                          initialUrl: googleFormURL,
                          gestureNavigationEnabled: true,
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
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