part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onChange;

  CustomRadioButton({
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
          width: 15,
          height: 15,
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