import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/LaunchScreenToHomepage.dart';
import 'package:elderly_squire_2023_remastered_v2/LaunchScreenToMainScreen.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/authenticate.dart';
import 'package:elderly_squire_2023_remastered_v2/OnBoarding%20page/LaunchScreenToOnBoardingPage.dart';
import 'package:elderly_squire_2023_remastered_v2/OnBoarding%20page/OnBoardingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticateOnboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Authenticate();
    }
    return LaunchScreenToOnboardingPage();
  }
}




