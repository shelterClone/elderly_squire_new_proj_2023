import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthWeightContent.dart';
import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthyEatingContent.dart';
import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:flutter/material.dart';


class HealthTipsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
//        backgroundColor: Colors.blueGrey[900],
        backgroundColor: Colors.blueGrey,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        title: Image.asset('assets/images/healthy.png',
            height: 40, width: 125),
      ),

      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 150,
              child: Card(
                //------------------------------Health Weight---------------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealthWeightContent()),
                              );
                          },
                          child: Image.asset('assets/images/weight-scale.png',
                              height: 300, width: 70),
                        )),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 51, left: 25),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthWeightContent()),
                                );
                              },
                              child: Text(
                                'Health Weight',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              'Application for Senior Citizen ID',
//                              style: TextStyle(
//                                fontFamily: ('OpenSans'),
//                                fontSize: 14,
//
////                                  fontWeight: FontWeight.bold
//                              ),
//                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),

          ),

          GestureDetector(
            child: Container(
              height: 150,
              child: Card(
                //------------------------------Healthy Eating---------------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HealthyEatingContent()),
                              );
                          },
                          child: Image.asset('assets/images/diet.png',
                              height: 300, width: 70),
                        )),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 51, left: 25),
                            child: InkWell(
//                                onTap: () {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => ID_Reg()),
//                                  );
//                                },
                              child: Text(
                                'Healthy Eating',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              'Application for Senior Citizen ID',
//                              style: TextStyle(
//                                fontFamily: ('OpenSans'),
//                                fontSize: 14,
//
////                                  fontWeight: FontWeight.bold
//                              ),
//                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),

          ),

          GestureDetector(
            child: Container(
              height: 150,
              child: Card(
                //------------------------------Physical Activity---------------------------------//
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: InkWell(
                          onTap: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => ID_Reg()),
//                              );
                          },
                          child: Image.asset('assets/images/weights_new.png',
                              height: 300, width: 70),
                        )),
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 51, left: 25),
                            child: InkWell(
//                                onTap: () {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => ID_Reg()),
//                                  );
//                                },
                              child: Text(
                                'Physical Activty',
                                style: TextStyle(
                                    fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              'Application for Senior Citizen ID',
//                              style: TextStyle(
//                                fontFamily: ('OpenSans'),
//                                fontSize: 14,
//
////                                  fontWeight: FontWeight.bold
//                              ),
//                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),

          ),

        ],


      ),



    );
  }
}
