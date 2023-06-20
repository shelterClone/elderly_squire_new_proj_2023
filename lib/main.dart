//import 'package:elderly_squire_2023_remastered/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/LaunchScreen.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/ID_Registration.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Login2.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Register.dart';
import 'package:elderly_squire_2023_remastered_v2/PrivacyPolicy.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome to Elderly Squire",
                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
                          fontFamily: ('OpenSans'),
                          fontSize: 30,

                        ),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
//                  Text("description here ",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                      color: Colors.grey[700],
//                      fontSize: 15,
//
//                    ),)
                ],
              ),
//              Container(
//                height: MediaQuery.of(context).size.height / 4,
//                decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: AssetImage("assets/images/elderly_home.png", )
//                    )
//                ),
//              ),
                Container(
                  child: Image.asset('assets/images/elderly_home.png')
                ),


              Column(
                children: <Widget>[
                  // the login button
                  Container(//---------------------------------------------Login--------------------------//
                    height: 60,
                    width: 330,
                    margin: EdgeInsets.only(bottom: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Colors.blueGrey,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: ('OpenSans'),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onPressed: (){
//                        _UserLogin(myEmail.text, password.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage2()));
                      },
                    ),
                  ),
                  // creating the signup button
                  Container(//--------------------------------Register--------------------------//
                    height: 60,
                    width: 330,
                    margin: EdgeInsets.only(bottom: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Colors.redAccent,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: ('OpenSans'),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onPressed: (){
//                        _UserLogin(myEmail.text, password.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));
                      },
                    ),
                  ),

                  TextButton(
                    child: Text('Privacy Policy',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,

                        )),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TermsAndConditions()));


                    },
                  ),


                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}

