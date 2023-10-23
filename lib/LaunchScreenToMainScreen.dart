import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:flutter/material.dart';


//-------------Splash screen to Homepage if the user is currently logged in--------------------//

class SplashScreenToMainScreen extends StatefulWidget {
  @override
  _SplashScreenToMainScreenState createState() => _SplashScreenToMainScreenState();
}

class _SplashScreenToMainScreenState extends State<SplashScreenToMainScreen> {
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



