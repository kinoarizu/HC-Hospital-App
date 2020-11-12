part of 'package:heaven_canceller_hospital/ui/ui.dart';

class CustomRadioButton extends StatelessWidget {
  final double size;
  final String value;
  final String groupValue;
  final Function(String) onChange;

  CustomRadioButton({
    this.size = 15,
    this.value,
    this.groupValue,
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
        SizedBox(
          width: 8,
        ),
        Text(
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