part of 'package:heaven_canceller_hospital/ui/widgets/widgets.dart';

class EmptyViewState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/empty_state.png",
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tidak Ada Hasil",
            style: mediumBaseFont.copyWith(
              color: darkGreyColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}