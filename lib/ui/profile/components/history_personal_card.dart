part of 'package:heaven_canceller_hospital/ui/ui.dart';

class HistoryPersonalCard extends StatelessWidget {
  final Booking historyBooking;
  final Function onTap;
  final bool isFinish;

  HistoryPersonalCard(
    this.historyBooking, {
    this.onTap,
    this.isFinish = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: deviceWidth(context),
        height: 106,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        color: (isFinish) ? baseColor : Color(0xFFF2F2F2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: historyBooking.doctor.photo,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              placeholder: (_, url) => SpinKitRing(
                color: accentColor,
                size: 40,
              ),
              imageBuilder: (_, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        historyBooking.doctor.name,
                        textAlign: TextAlign.start,
                        style: semiBoldBaseFont.copyWith(
                          color: darkGreyColor,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        historyBooking.doctor.speciality,
                        textAlign: TextAlign.start,
                        style: mediumBaseFont.copyWith(
                          color: darkGreyColor,
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        historyBooking.schedule,
                        style: mediumBaseFont.copyWith(
                          color: greyColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTimeUtil.generateDiffHuman(historyBooking.time),
                        style: regularBaseFont.copyWith(
                          fontSize: 11,
                          color: greyColor,
                        ),
                      ),
                      Container(
                        height: 20,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11,
                        ),
                        decoration: BoxDecoration(
                          color: (isFinish) ? finishColor : onGoingColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            (isFinish) ? "Selesai" : "Dibooking",
                            style: semiBoldBaseFont.copyWith(
                              fontSize: 10,
                              color: baseColor,
                            ),
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
      ),
      onTap: onTap,
    );
  }
}