part of 'package:heaven_canceller_hospital/ui/ui.dart';

class PatientRadioOption extends StatelessWidget {
  final String name;
  final String gender;
  final String status;
  final String value;
  final String groupValue;
  final Function(String) onChange;

  PatientRadioOption({
    this.name,
    this.gender,
    this.status,
    this.value,
    this.groupValue,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: lightGreyColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ("Nama: $name").replaceAll(RegExp(r'"'), ""),
                textAlign: TextAlign.start,
                style: regularBaseFont.copyWith(
                  color: greyColor,
                  fontSize: 12,
                  height: 1.7,
                ),
              ),
              Text(
                ("Jenis Kelamin: $gender").replaceAll(RegExp(r'"'), ""),
                textAlign: TextAlign.start,
                style: regularBaseFont.copyWith(
                  color: greyColor,
                  fontSize: 12,
                  height: 1.7,
                ),
              ),
              Text(
                ("Status: $status").replaceAll(RegExp(r'"'), ""),
                textAlign: TextAlign.start,
                style: regularBaseFont.copyWith(
                  color: greyColor,
                  fontSize: 12,
                  height: 1.7,
                ),
              ),
            ],
          ),
          CustomRadioButton(
            isLabelShow: false,
            size: 24,
            value: value,
            groupValue: groupValue,
            onChange: onChange,
          ),
        ],
      ),
    );
  }
}