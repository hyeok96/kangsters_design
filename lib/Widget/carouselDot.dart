import 'package:flutter/material.dart';

class CarouselDot extends StatelessWidget {
  const CarouselDot({
    super.key,
    required this.carouselDot,
    required this.selectedCarousel,
    required this.unSelectedCarousel,
  });

  final int carouselDot;
  final List<Color> selectedCarousel;
  final List<Color> unSelectedCarousel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: carouselDot == index
                    ? LinearGradient(
                        colors: selectedCarousel,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    : LinearGradient(
                        colors: unSelectedCarousel,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
              ),
            ),
            const SizedBox(
              width: 7,
            )
          ],
        ),
      ),
    );
  }
}
