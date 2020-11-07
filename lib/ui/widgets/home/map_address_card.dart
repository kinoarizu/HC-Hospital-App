part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class MapAddressCard extends StatelessWidget {
  final String placeName;
  final String address;
  final String image;

  MapAddressCard({
    this.placeName,
    this.address,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 270,
        height: 72,
        padding: EdgeInsets.all(8.2),
        margin: EdgeInsets.only(
          bottom: 17,
        ),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 73.85,
              height: 55.38,
            ),
            SizedBox(
              width: 12.54,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  placeName,
                  style: semiBoldBaseFont.copyWith(
                    fontSize: 12,
                    color: darkGreyColor,
                  ),
                ),
                Text(
                  address,
                  style: regularBaseFont.copyWith(
                    fontSize: 12,
                    color: lightGreyColor,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}