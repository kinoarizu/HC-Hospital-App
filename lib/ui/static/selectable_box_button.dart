part of 'package:heaven_canceller_hospital/ui/ui.dart';

class SelectableBoxButton extends StatelessWidget {
  final double borderRadius;
  final double thickBorder;
  final String content;
  final bool isSelected;
  final Color borderColor;
  final Color fontColor;
  final bool isMarginRight;
  final Function onTap;

  SelectableBoxButton({
    this.borderRadius,
    this.thickBorder,
    this.content,
    this.isSelected = false,
    this.borderColor = accentColor,
    this.fontColor = accentColor,
    this.isMarginRight = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: isMarginRight ? 12 : 0,
          bottom: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: isSelected ? accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isSelected ? accentColor : borderColor,
            width: thickBorder,
          ),
        ),
        child: Text(
          content,
          style: mediumBaseFont.copyWith(
            color: isSelected ? baseColor : fontColor,
            fontSize: 11,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}