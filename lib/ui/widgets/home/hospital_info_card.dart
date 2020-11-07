part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class HospitalInfoCard extends StatelessWidget {
  final String placeName;
  final String address;
  final String regularSchedule;
  final String weekendSchedule;
  final String image;

  HospitalInfoCard({
    this.placeName,
    this.address,
    this.regularSchedule,
    this.weekendSchedule,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultWidth(context),
      margin: EdgeInsets.only(
        bottom: 16, 
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
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
          Image.asset(
            image,
            width: 60,
            height: 60,
          ),
          Container(
            width: 1.3,
            height: 65,
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: lightGreyColor.withOpacity(0.5),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                placeName,
                style: semiBoldBaseFont.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                address,
                style: regularBaseFont.copyWith(
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                regularSchedule,
                style: regularBaseFont.copyWith(
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                weekendSchedule,
                style: regularBaseFont.copyWith(
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}