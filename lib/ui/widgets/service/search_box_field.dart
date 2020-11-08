part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class SearchBoxField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  SearchBoxField({
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: regularBaseFont.copyWith(
        fontSize: 13,
        color: darkGreyColor,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        hintText: "Cari event, promo, fasilitas, layanan",
        hintStyle: regularBaseFont.copyWith(
          fontSize: 13,
          color: lightGreyColor,
        ),
        contentPadding: EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkGreyColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightGreyColor),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 18,
          color: lightGreyColor,
        ),
      ),
      onChanged: onChanged,
    );
  }
}