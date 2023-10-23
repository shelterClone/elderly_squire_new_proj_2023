import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToMainScreen();
  }

  void navigateToMainScreen() {

    Future.delayed(Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize the background color or other properties as desired
      backgroundColor: Colors.blueGrey,
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
