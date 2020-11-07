part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class ContactComplaintCard extends StatelessWidget {
  final String icon;
  final String content;
  final Function onTap;

  ContactComplaintCard({
    this.icon,
    this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: defaultWidth(context) / 2 - 8,
        height: 45,
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: baseColor,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              width: 14,
              height: 14,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              content,
              style: regularBaseFont.copyWith(
                fontSize: 11.5,
                color: lightGreyColor,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}