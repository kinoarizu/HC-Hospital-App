part of 'package:heaven_canceller_hospital/ui/ui.dart';

class NotificationPersonalCard extends StatelessWidget {
  final PersonalNotification notification;
  final Function onTap;
  final bool isNew;

  NotificationPersonalCard(
    this.notification, {
    this.onTap,
    this.isNew = false,
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
        color: (isNew) ? Color(0xFFF2F2F2) : baseColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              notification.imagePath,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: semiBoldBaseFont.copyWith(
                      color: darkGreyColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    notification.subtitle,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    style: regularBaseFont.copyWith(
                      color: darkGreyColor,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTimeUtil.generateDiffHuman(notification.time),
                        style: regularBaseFont.copyWith(
                          fontSize: 11,
                          color: greyColor,
                        ),
                      ),
                      if (isNew) Container(
                        width: 44,
                        height: 20,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "New",
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