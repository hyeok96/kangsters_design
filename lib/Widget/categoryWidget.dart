import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.selectedCarousel,
    required this.CategoryList,
    required this.CategoryName,
  });

  final List<Color> selectedCarousel;
  final List CategoryList;
  final List<String> CategoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40),
      height: 86,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 76,
              height: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: index == 2
                    ? LinearGradient(
                        colors: selectedCarousel,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                color:
                    index == 2 ? Colors.black : Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryList[index],
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    CategoryName[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: 5),
    );
  }
}
