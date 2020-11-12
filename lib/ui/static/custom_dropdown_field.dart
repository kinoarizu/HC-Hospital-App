part of 'package:heaven_canceller_hospital/ui/ui.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelName;
  final String hintText;
  final String errorValidation;
  final String value;
  final List<String> options;
  final Function(String) onChanged;

  CustomDropdownField({
    this.errorValidation,
    this.onChanged,
    this.labelName,
    this.hintText,
    this.value,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelName,
              style: mediumBaseFont.copyWith(
                fontSize: 12,
                color: darkGreyColor,
              ),
            ),
            if (errorValidation != null) Text(
              errorValidation,
              style: regularBaseFont.copyWith(
                color: maroonColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        DropdownButtonFormField(
          hint: Text(
            hintText,
            style: regularBaseFont.copyWith(
              fontSize: 13,
              color: lightGreyColor,
            ),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: lightGreyColor,
              ),
            ),
          ),
          value: value,
          items: options.map((String option) {
            return DropdownMenuItem(
              child: Text(
                option,
                style: regularBaseFont.copyWith(
                  fontSize: 13,
                  color: darkGreyColor,
                ),
              ),
              value: option,
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}