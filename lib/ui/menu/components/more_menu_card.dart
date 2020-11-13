part of 'package:heaven_canceller_hospital/ui/ui.dart';

class MoreMenuCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function onTap;

  MoreMenuCard({
    this.title,
    this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: defaultWidth(context),
        height: 50,
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 12,
              offset: Offset(0, 0),
              spreadRadius: -5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: mediumBaseFont.copyWith(
                fontSize: 13,
                color: darkGreyColor,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}