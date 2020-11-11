part of 'package:heaven_canceller_hospital/ui/ui.dart';

class DoctorViewCard extends StatelessWidget {
  final Doctor doctor;
  final Function onTap;

  DoctorViewCard(
    this.doctor, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 20,
              offset: Offset(0, 0),
              spreadRadius: -5,
            ),
          ],
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
                    imageUrl: doctor.photo,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SpinKitRing(
                      color: accentColor,
                      size: 50,
                    ),
                  ),
                  Container(
                    height: 130,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: (doctor.status == "Online") ? finishColor : orangeColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        doctor.status,
                        style: mediumBaseFont.copyWith(
                          fontSize: 11,
                          color: (doctor.status == "Online") ? finishColor : orangeColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: yellowColor,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        doctor.star.toString(),
                        style: mediumBaseFont.copyWith(
                          color: darkGreyColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}