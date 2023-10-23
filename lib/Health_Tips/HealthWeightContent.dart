import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class HealthWeightContent extends StatelessWidget {
//  final String email;
//  final screenHeight = MediaQuery.of(context).size.height;

//  HealthWeightContent({@required this.email});

//  Home({this.email});

//LoginState login =  LoginState();

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
                MaterialPageRoute(builder: (context) => HealthTipsMenu()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/weight-scale.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // height: 2445,
            height: 2500,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "\nHealthy Weight\n",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/exercise_new.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 20,bottom: 20),
                    child: Text(
                      "Why is keeping a healthy weight important?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top: 20, bottom: 20,right:20),
                    child: Text(
                      "Your body changes as you age. For example, if you are less active,"
                          "your muscles may not work as"
                          " well, and that can affect your strength."
                          "You may also use fewer calories, especially if you don’t get any physical activity."
                          "Over time, if you eat and drink more calories from food or beverages than your body"
                          "uses from physical activity and daily living, your body may store the extra calories leading"
                          " to weight gain. Extra weight may lead to overweight or obesity.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top: 20, bottom: 20,right:20),
                    child: Text(
                      "Overweight and obesity may increase your risk for",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20,left:20,right:150
                    ),
                    child: Text(
                      "- type 2 diabetes\n"
                          "\n- heart disease and stroke\n"
                          "\n- high blood pressure\n"
                          "\n- high blood cholesterol \n"
                          "\n- kidney disease \n"
                          "\n- fatty liver disease \n"
                          "\n- certain types of cancer\n"
                          "\n- Alzheimer’s disease and other dementias\n",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 20,bottom: 20),
                    child: Text(
                      "What is a healthy weight for me?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top: 20, bottom: 20,right:20),
                    child: Text(
                      "Two measures can help you determine whether you are at a healthy weight.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20,left:20,right:20
                    ),
                    child: Text(
                      "- Body mass index (BMI) is a measure based on your weight in relation to your height. You can use an online tool to calculate your BMI ",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20,left:20,right:20
                    ),
                    child: Text(
                      "- Experts recommend that older adults have a BMI between 25 and 27 NIH external link—"
                          "slightly higher than the recommended range of 18.5 to 24.9 for younger adults. On the other hand, "
                          "some people, particularly older adults, can have a BMI in the normal range, but still have too much body fat. That’s why it’s also important to also measure your waist size. ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20,left:20,right:20
                    ),
                    child: Text(
                      "- Your waist size is a measure that may tell you if you carry too much body fat. Women with a waist size of more than 35 inches and men with a waist size of more than 40 inches may be more likely to develop health problems. ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/tape_measure.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top: 20, bottom: 20,right:20),
                    child: Text(
                      "Being underweight can also be a health concern for older adults. It could mean that you",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20,left:20,right:20
                    ),
                    child: Text(
                      "- have increased risk for weakness and bone loss"
                          "\n- are not eating enough calories to maintain your weight\n"
                          "\n- don’t have access to enough food or foods that meet your nutrient needs\n"
                          "\n- have an illness or medical condition \n"
                          "\n- Keeping a healthy weight may help improve your health. The weight that is healthiest for you may be higher than that of a younger person."
                          " Ask your health care professional what a healthy weight for you may be. \n",


                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  // Container(
                  //   //-----------------------------------------------------------------------------------------------back Next
                  //
                  //   margin: EdgeInsets.only(top: 5,left:50, right: 50),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: <Widget>[
                  //
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.redAccent,
                  //           onPrimary: Colors.white,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //           ),
                  //         ),
                  //         child: Row(
                  //           children: <Widget>[
                  //             Icon(
                  //               Icons.arrow_back_ios,
                  //               size: 15,
                  //             ),
                  //             Text(
                  //               "Back",
                  //               style: TextStyle(
                  //                   fontSize: 15,
                  //                   fontFamily: ('OpenSans'),
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ],
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => HealthTipsMenu()),
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Container(//------------------Back (New)------------------------//
                    height: 55,
                    width: 250,
                    // height: 50,
                    // width: 280,

                    // margin: EdgeInsets.only(bottom: 15),
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
                          "Back",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: ('OpenSans'),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onPressed: (){
//                        _UserLogin(myEmail.text, password.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HealthTipsMenu()));
                      },
                    ),
                  ),


                ],
              ),
            ),
          ),

//          Container(
//            margin: EdgeInsets.only(left:50,top:50),
//            height: 60,
//            width:60,
//
//            child: CircleAvatar(
//              radius: 5,
//              backgroundColor: Colors.lightBlue,
//             child: Icon(
//               Icons.person,
//                   color: Colors.white,
//               size: 30,
//             ),
//            ),
//          )
        ),
      ),
    );
  }
}
