import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsters_design/Widget/bottomAppBarWidget.dart';
import 'package:kangsters_design/Widget/carouselDot.dart';
import 'package:kangsters_design/Widget/carouselWodget.dart';
import 'package:kangsters_design/Widget/categoryWidget.dart';
import 'package:kangsters_design/Widget/todayWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(viewportFraction: 0.8);

  List<Color> selectedCarousel = [
    const Color(0xffFFA493),
    const Color(0xffFD1493),
  ];

  List<Color> unSelectedCarousel = [
    const Color(0xff6A4A60),
    const Color(0xff692B60),
  ];

  List CategoryList = [
    SvgPicture.asset("assets/workoutCategory/ic_Barbell.svg"),
    SvgPicture.asset("assets/workoutCategory/ic_pingpong.svg"),
    SvgPicture.asset("assets/workoutCategory/ic_Fight.svg"),
    SvgPicture.asset("assets/workoutCategory/ic_ropeSkipping.svg"),
    SvgPicture.asset("assets/workoutCategory/ic_Swim.svg"),
  ];

  List<String> CategoryName = [
    "Barbell",
    "Pingpong",
    "Figh",
    "RopeSkipping",
    "Swi"
  ];

  int carouselDot = 0;
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272844),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Image.asset(
                      "assets/appbar/ic_top_user.png",
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Hello, Kangsters",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Workout Together",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            carouselDot = value;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            CarouselWidget(index: index),
                        itemCount: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselDot(
                        carouselDot: carouselDot,
                        selectedCarousel: selectedCarousel,
                        unSelectedCarousel: unSelectedCarousel),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CategoryWidget(
                        selectedCarousel: selectedCarousel,
                        CategoryList: CategoryList,
                        CategoryName: CategoryName)
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xff32344D),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                              "assets/historyCard/ic_Run.svg")),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: selectedCarousel,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/historyCard/ic_time.svg")),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "08:00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "08:00",
                              style: TextStyle(
                                color: Color(0xff9D9DAE),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const TodayWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
