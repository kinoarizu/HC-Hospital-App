part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class AccentRaisedButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double borderRadius;
  final String text;
  final double fontSize;
  final Function onPressed;

  AccentRaisedButton({
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.text,
    this.fontSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        hoverElevation: 0,
        color: color,
        elevation: 0,
        splashColor: baseColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: mediumBaseFont.copyWith(
            fontSize: fontSize,
            color: baseColor,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}