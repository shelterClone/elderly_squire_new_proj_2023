import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/LaunchScreenToAdminHomepage.dart';
import 'package:elderly_squire_2023_remastered_v2/LaunchScreenToHomepage.dart';
import 'package:elderly_squire_2023_remastered_v2/LaunchScreenToMainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    // final AdminfirebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      // return Homepage();
      final isAdmin = checkIfAdmin(firebaseUser);

      if (isAdmin) {
        return SplashScreenToAdminHomepage();
      } else {
        return SplashScreenToHomepage();
      }
    }
    return SplashScreenToMainScreen();
  }


  bool checkIfAdmin(User user) {
    return user.email == 'adminosca@gmail.com';
  }








}