part of 'package:heaven_canceller_hospital/ui/ui.dart';

class CarouselIndicator extends StatelessWidget {
  final List<String> imageURLs;

  CarouselIndicator(this.imageURLs);

  @override
  Widget build(BuildContext context) {
    CarouselProvider carousel = Provider.of<CarouselProvider>(context);

    return Row(
      children: imageURLs.map((url) {
        int index = imageURLs.indexOf(url);
        return Container(
          width: (carousel.current == index) ? 14 : 8,
          height: 8,
          margin: EdgeInsets.symmetric(
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            shape: (carousel.current == index) ? BoxShape.rectangle : BoxShape.circle,
            color: (carousel.current == index) ? accentColor : baseColor,
            borderRadius: (carousel.current == index) ? BorderRadius.circular(8) : null,
          ),
        );
      }).toList(),
    );
  }
}