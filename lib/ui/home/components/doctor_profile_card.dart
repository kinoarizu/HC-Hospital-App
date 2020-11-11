part of 'package:heaven_canceller_hospital/ui/ui.dart';

class DoctorProfileCard extends StatelessWidget {
  final Doctor doctor;
  final Function onTap;

  DoctorProfileCard(
    this.doctor, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 132,
        height: 196,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: 132,
                    height: 120,
                    imageUrl: doctor.photo,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SpinKitRing(
                      color: accentColor,
                      size: 50,
                    ),
                  ),
                  Container(
                    width: 132,
                    height: 120,
                    color: blackColor.withOpacity(0.2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                doctor.name,
                style: semiBoldBaseFont.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                doctor.speciality,
                style: mediumBaseFont.copyWith(
                  fontSize: 11,
                  color: lightGreyColor
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                Doctor.generateTimeAvailable(doctor.doctorSchedule) ?? "Libur",
                style: mediumBaseFont.copyWith(
                  fontSize: 11,
                  color: (Doctor.generateTimeAvailable(doctor.doctorSchedule) == "Libur") ? orangeColor : accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}