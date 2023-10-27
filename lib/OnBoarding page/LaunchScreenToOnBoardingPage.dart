import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/OnBoarding%20page/OnBoardingScreen.dart';
import 'package:flutter/material.dart';



//-------------Splash screen to Onboarding Page when the app is launched for the firsttime--------------------//

class LaunchScreenToOnboardingPage extends StatefulWidget {
  @override
  _LaunchScreenToOnboardingPageState createState() => _LaunchScreenToOnboardingPageState();
}

class _LaunchScreenToOnboardingPageState extends State<LaunchScreenToOnboardingPage> {
  @override
  void initState() {
    super.initState();
    navigateToOnboardingPage();
  }

  void navigateToOnboardingPage() {
    Future.delayed(Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize the background color or other properties as desired
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Image.asset(
          'assets/images/elderly_squire_logo_classic_icon.png',
          height:100,
          width: 100,
        ),
      ),
    );
  }
}


