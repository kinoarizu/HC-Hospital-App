part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class AboutUsCard extends StatelessWidget {
  final HospitalContact hospitalContact;

  AboutUsCard(this.hospitalContact);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultWidth(context),
      margin: EdgeInsets.only(
        bottom: 16,
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
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 14,
            ),
            child: Column(
              children: [
                Image.asset(
                  hospitalContact.iconPath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(
                  hospitalContact.title,
                  style: boldBaseFont.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.3,
            height: 110,
            margin: EdgeInsets.only(
              right: 2,
            ),
            decoration: BoxDecoration(
              color: lightGreyColor.withOpacity(0.5),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hospitalContact.firstContact[0],
                  textAlign: TextAlign.start,
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  hospitalContact.firstContact[1],
                  textAlign: TextAlign.start,
                  style: regularBaseFont.copyWith(
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  hospitalContact.secondContact[0],
                  textAlign: TextAlign.start,
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  hospitalContact.secondContact[1],
                  textAlign: TextAlign.start,
                  style: regularBaseFont.copyWith(
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  hospitalContact.thirdContact[0],
                  textAlign: TextAlign.start,
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  hospitalContact.thirdContact[1],
                  textAlign: TextAlign.start,
                  style: regularBaseFont.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}