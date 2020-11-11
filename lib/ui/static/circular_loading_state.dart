part of 'package:heaven_canceller_hospital/ui/ui.dart';

class CircularLoadingState extends StatelessWidget {
  final double height;
  final String state;
  final Color color;
  final Color fontColor;

  CircularLoadingState({
    this.height,
    this.state,
    this.color = accentColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth(context),
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRing(
              color: color,
              size: 50,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              state,
              style: mediumBaseFont.copyWith(
                fontSize: 13,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}