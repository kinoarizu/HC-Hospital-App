part of 'package:heaven_canceller_hospital/ui/ui.dart';

class CustomRadioButton extends StatelessWidget {
  final double size;
  final String value;
  final String groupValue;
  final bool isLabelShow;
  final Function(String) onChange;

  CustomRadioButton({
    this.size = 15,
    this.value,
    this.groupValue,
    this.isLabelShow = true,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChange,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: accentColor,
          ),
        ),
        if (isLabelShow) SizedBox(
          width: 8,
        ),
        if (isLabelShow) Text(
          value,
          style: regularBaseFont.copyWith(
            fontSize: 12,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}