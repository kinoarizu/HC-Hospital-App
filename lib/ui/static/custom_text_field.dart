part of 'package:heaven_canceller_hospital/ui/ui.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String errorValidation;
  final int maxLines;
  final TextInputFormatter inputFormatter;
  final double fontSize;

  CustomTextField({
    this.labelText, 
    this.hintText, 
    this.controller, 
    this.onChanged, 
    this.keyboardType = TextInputType.text, 
    this.obscureText = false, 
    this.suffixIcon, 
    this.prefixIcon, 
    this.errorValidation, 
    this.maxLines, 
    this.inputFormatter,
    this.fontSize = 14,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (labelText != null) Text(
              labelText,
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
        TextField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          style: regularBaseFont.copyWith(fontSize: fontSize),
          maxLines: (maxLines != null) ? maxLines : 1,
          onChanged: onChanged,
          inputFormatters: (inputFormatter != null) ? [inputFormatter] : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: regularBaseFont.copyWith(
              fontSize: fontSize - 1,
              color: lightGreyColor,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: lightGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: darkGreyColor,
              ),
            ),
            suffixIcon: suffixIcon,
            prefix: prefixIcon,
          ),
        ),
      ],
    );
  }
}