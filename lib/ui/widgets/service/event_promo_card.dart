part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class EventPromoCard extends StatelessWidget {
  final EventPromo eventPromo;
  final Function onTap;

  EventPromoCard(
    this.eventPromo, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: defaultWidth(context),
        height: 218,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: defaultWidth(context),
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: eventPromo.imageURL,
                      height: 120,
                      width: defaultWidth(context),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SpinKitRing(
                        color: accentColor,
                        size: 50,
                      ),
                    ),
                    Container(
                      width: defaultWidth(context),
                      height: 120,
                      color: blackColor.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eventPromo.type,
                    style: mediumBaseFont.copyWith(
                      fontSize: 11,
                      color: accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    eventPromo.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: semiBoldBaseFont.copyWith(
                      fontSize: 12,
                      color: darkGreyColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    eventPromo.content[0],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: regularBaseFont.copyWith(
                      fontSize: 11,
                      color: greyColor,
                    ),
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