import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/AdminHomepage.dart';
import 'package:elderly_squire_2023_remastered_v2/News/NewsHome.dart';
import 'package:flutter/material.dart';



//-------------Splash screen to Homepage if the Admin user is still logged in--------------------//

class SplashScreenToAdminHomepage extends StatefulWidget {
  @override
  _SplashScreenToAdminHomepageState createState() => _SplashScreenToAdminHomepageState();
}

class _SplashScreenToAdminHomepageState extends State<SplashScreenToAdminHomepage> {
  @override
  void initState() {
    super.initState();
    navigateToHomepage();
  }

  void navigateToHomepage() {
    Future.delayed(Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => NewsHome()),
        MaterialPageRoute(builder: (context) => AdminHomepage()),
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


