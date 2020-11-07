part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class DoctorScheduleInfo extends StatelessWidget {
  final String day;
  final String time;
  final String place;

  DoctorScheduleInfo({
    this.day,
    this.time,
    this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: semiBoldBaseFont.copyWith(
                fontSize: 14,
                color: darkGreyColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              time,
              style: mediumBaseFont.copyWith(
                fontSize: 11,
                color: accentColor,
              ),
            ),
          ],
        ),
        Text(
          place,
          style: regularBaseFont.copyWith(
            fontSize: 13,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}