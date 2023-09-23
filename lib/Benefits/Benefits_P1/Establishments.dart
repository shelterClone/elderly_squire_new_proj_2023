import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P1/BenefitsMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';

import 'package:flutter/material.dart';


class Establishments extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
              backgroundColor: Colors.blueGrey[900],

              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BenefitsMenu()),
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios, // add custom icons also
                ),
              ),
              title: Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Image.asset(
                    'assets/images/elderly_squire_logo_classic_icon.png',
                    height: 40,
                    width: 125),
              ),
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 800,
                  width: 1000,
                  child: Card(
                    margin: EdgeInsets.all(20),
                    elevation: 1,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:40),
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/company.png',
                            height: 100,
                            width: 130,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "Establishments",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: ('BebasNeue'),
                            ),
                          ),
                        ),
                        // ),
                        SizedBox(height:20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Hotels",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Restaurants",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Theaters",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Cinemas",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Concert halls",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Circuses",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Leisure",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // margin: EdgeInsets.only(left: 5, top: 30, bottom: 20),
                          padding:EdgeInsets.only(left:20),
                          child: Row(

                            children: [
                              Icon(Icons.check_circle_rounded,color:Colors.lightGreen),
                              SizedBox(width: 10),
                              Text(
                                "Amusement",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ('OpenSans'),

                                ),
                              ),
                            ],
                          ),
                        ),









                        Container(//----next-----------//
                          margin: EdgeInsets.only(top:50),
                          height: 45,
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left:40,right:10),
                                  child: Text('Back',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ) ,),
                                )


                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BenefitsMenu()),
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ))));
  }}