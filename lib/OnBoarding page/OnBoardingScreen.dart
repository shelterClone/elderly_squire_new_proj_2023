import 'dart:async';
import 'package:elderly_squire_2023_remastered_v2/OnBoarding%20page/OnBoardingModel.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (_pageIndex < 7) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  // void goToNext() {
  //   if (_pageIndex < demoData.length - 1) {
  //     setState(() {
  //       _pageIndex++;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white

        ),
        child: Column(
          children: [
            // Carousel area
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].image,
                ),
              ),
            ),
            // Indicator area
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    demoData.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            // Button area
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );


              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                // height: MediaQuery.of(context).size.height * 0.075,
                // width: double.infinity,
                height: 50,
                // width: 140,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontFamily: "Opensans",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height:200),
        SizedBox(height:140),
        Container(
          height: 110,
          width: 110,
          child: Image.asset(
              image),
        ),
        SizedBox(height:40),
        Container(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              // color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
          // height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left:10, right:10),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black38,
              fontSize: 15,
            ),
          ),
        ),
        // const Spacer(),
        SizedBox(height:70),

        const Spacer(),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.white,
        border: isActive ? null : Border.all(color: Colors.blue),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

