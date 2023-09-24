//import 'package:elderly_squire_capstone/HomePage2.dart';
//import 'package:elderly_squire_capstone/todo_list.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P1/BenefitsMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P2/BenefitsMenu2.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P4/BenefitsMenu4.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P3/DeathBenefits.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P3/MandatoryPHealth.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P3/SocialPension.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P3/SocialSafetyNets.dart';
import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/Medicine%20Reminder/ReminderHome.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/todos.dart';
import 'package:flutter/material.dart';


class BenefitsMenu3 extends StatelessWidget {
  // final String email;
  // MedicineMenu({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 75,
//        backgroundColor: Colors.blueGrey[900],
          backgroundColor: Colors.blueGrey[900],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Icon(
              Icons.arrow_back_ios_new, // add custom icons also
            ),
          ),
          title: Image.asset('assets/images/scardbene.png',
              height: 40, width: 125),
        ),

        body: Column(
            children:<Widget>[
              GestureDetector(
                child: Container(
                  height: 120,
                  child: Card(
                    // color: Colors.indigo,
                    color: Colors.brown[400],
                    //------------------------------Social Pension---------------------------------//
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30,bottom:10,top:8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SocialPension()),
                                );
                              },
                              child: Image.asset('assets/images/flat.png',
                                  height: 75, width: 90
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left:15,top:29),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SocialPension()),
                                      );
                                    },
                                    child: Text(
                                      'Social Pension',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: ('BebasNeue'),
                                        fontSize: 25,

//                                  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                child: Container(
                  height: 120,
                  child: Card(
                    color: Colors.brown[400],
                    // color: Colors.blueGrey[900],
                    //------------------------------Mandatory Philhealth Coverage-------------------------------//
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30,bottom:10,top:8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MandatoryPhealth()),
                                );
                              },
                              child: Image.asset('assets/images/dumbbell.png',
                                  height: 75, width: 90

                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left:15,top:15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MandatoryPhealth()),
                                      );
                                    },
                                    child: Text(
                                      'Mandatory Philhealth',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: ('BebasNeue'),
                                        fontSize: 23,

//                                  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )),
                              Container(
                                // margin: EdgeInsets.only(left: 25),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MandatoryPhealth()),
                                      );
                                    },
                                    child: Text(
                                      'Coverage',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: ('BebasNeue'),
                                        fontSize: 23,

//                                  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                child: Container(
                  height: 120,
                  child: Card(
                    color: Colors.brown[400],
                    // color: Colors.blueGrey[900],
                    //------------------------------Social Safety Nets-------------------------------//
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30,bottom:10,top:8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SocialSafetyNets()),
                                );
                              },
                              child: Image.asset('assets/images/lola.png',
                                  height: 75, width: 90

                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left:15,top:29),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SocialSafetyNets()),
                                      );
                                    },
                                    child: Text(
                                      'Social Safety Nets',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: ('BebasNeue'),
                                        fontSize: 25,

//                                  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                child: Container(
                  height: 120,
                  child: Card(
                    color: Colors.brown[400],
                    // color: Colors.blueGrey[900],
                    //------------------------------Death Benefits Assistance-------------------------------//
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30,bottom:10,top:8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeathBenefits()),
                                );
                              },
                              child: Image.asset('assets/images/grave.png',
                                  height: 75, width: 90

                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left:15,top:29),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DeathBenefits()),
                                      );
                                    },
                                    child: Text(
                                      'Death Benefits',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: ('BebasNeue'),
                                        fontSize: 25,

//                                  fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(//----next-----------//
                      margin: EdgeInsets.only(top:40),
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
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
                                builder: (context) => BenefitsMenu2()),
                          );
                        },
                      ),
                    ),
                    Container(//----next-----------//
                      margin: EdgeInsets.only(top:40),
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[400],
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left:40,right:10),
                              child: Text('Next',
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
                                builder: (context) => BenefitsMenu4()),
                          );
                        },
                      ),
                    ),

                  ]),



            ]
        )
    );
  }
}

