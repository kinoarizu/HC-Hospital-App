part of 'package:heaven_canceller_hospital/ui/ui.dart';

class LatestNewsCard extends StatelessWidget {
  final News news;
  final Function onTap;

  LatestNewsCard(
    this.news, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 196,
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
            Container(
              width: 196,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: news.imageURL,
                      height: 120,
                      width: 196,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SpinKitRing(
                        color: accentColor,
                        size: 50,
                      ),
                    ),
                    Container(
                      width: 196,
                      height: 120,
                      color: blackColor.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: semiBoldBaseFont.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.content[0],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: mediumBaseFont.copyWith(
                      fontSize: 11,
                      color: lightGreyColor,
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