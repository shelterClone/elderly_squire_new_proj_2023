import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/News/NewsHome.dart';
import 'package:flutter/material.dart';



//-------------Splash screen to Homepage if the user is still logged in--------------------//

class SplashScreenToHomepage extends StatefulWidget {
  @override
  _SplashScreenToHomepageState createState() => _SplashScreenToHomepageState();
}

class _SplashScreenToHomepageState extends State<SplashScreenToHomepage> {
  @override
  void initState() {
    super.initState();
    navigateToHomepage();
  }

  void navigateToHomepage() {
    Future.delayed(Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NewsHome()),
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


