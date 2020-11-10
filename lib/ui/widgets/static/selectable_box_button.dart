part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class SelectableBoxButton extends StatelessWidget {
  final double borderRadius;
  final double thickBorder;
  final String content;
  final bool isSelected;
  final Function onTap;

  SelectableBoxButton({
    this.borderRadius,
    this.thickBorder,
    this.content,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
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
            color: accentColor,
            width: thickBorder,
          ),
        ),
        child: Text(
          content,
          style: mediumBaseFont.copyWith(
            color: isSelected ? baseColor : accentColor,
            fontSize: 11,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}