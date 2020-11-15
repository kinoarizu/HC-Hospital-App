part of 'package:heaven_canceller_hospital/ui/ui.dart';

class MenuScreen extends StatelessWidget {
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
              /// SECTION: ICON TITLE HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/image/ic_menu_black.png",
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Menu",
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

              /// SECTION: MENU CARD LIST
              Column(
                children: [
                  MoreMenuCard(
                    title: "Tentang Kami",
                    iconPath: "assets/image/ic_menu_user.png",
                    onTap: () {
                      Navigator.pushNamed(context, AboutUsScreen.routeName);
                    },
                  ),
                  MoreMenuCard(
                    title: "Partner & Career",
                    iconPath: "assets/image/ic_menu_partner.png",
                    onTap: () {
                      Navigator.pushNamed(context, PartnerCareerScreen.routeName);
                    },
                  ),
                  MoreMenuCard(
                    title: "Feedback",
                    iconPath: "assets/image/ic_feedback.png",
                    onTap: () {
                      Navigator.pushNamed(context, FeedbackWebviewScreen.routeName);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}