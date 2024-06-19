

import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';
import 'package:flutter/material.dart';


class PhysicalActContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
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
                'assets/images/weights_new.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 5600,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(//----------------Physical Activity----------------------------//
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "\nPhysical Activity\n",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/dumbbell.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Physical activity is good for your health at every age. If you have never been active, "
                          "starting regular physical activity now may improve your strength, balance, flexibility,"
                          " and endurance—being able to move for periods of time without stopping.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Being physically active may help you maintain a healthy weight and avoid chronic health problems "
                          "as you mature. It may help you reduce symptoms of arthritis and  depression."
                          "It may help keep diabetes and high blood pressure under control. Being active may also help you"
                          " live on your own longer by keeping you healthy.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/bike.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20, bottom:20),
                    child: Text(
                      "When should I ask my health care professional about being active?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, bottom: 20, right: 20),
                    child: Text(
                      "According to the latest research healthy older adults who plan to "
                          "increase physical activity a little at a time generally do not need to talk with a health"
                          " care professional beforehand. However, your health care professional might be able to give"
                          " you information on types of activities to consider and how to progress at a safe and steady pace.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20,  bottom: 20, right: 20),
                    child: Text(
                      "Do check with your health care professional",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20),
                    child: Text(
                      "if you are already being treated for a chronic condition, such as type 2 diabetes,"
                          " heart disease, osteoarthritis NIH external link, high blood pressure, a physical"
                          " disability, or are a cancer survivor \n\n"
                          "if you have chest pain or pressure, dizziness, or joint pain \n\n"
                          "- if you want tips to avoid getting hurt\n\n"
                          "- if you develop new health concerns when increasing your activity level\n\n",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, bottom: 20, right: 20),
                    child: Text(
                      "Your health care professional may recommend and help you plan for the"
                          " types and amounts of physical activity that will suit you.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20,right:20),
                    child: Text(
                      "How much and what type of physical activity do I need?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Keep in mind that some physical activity is better than none."
                          " Aim to keep moving as often as you can.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Healthy older adults should regularly do five types of activities",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "- aerobic (also called endurance or cardio) activities \n\n"
                          "- activities to strengthen muscle\n\n"
                          "- activities to improve balance\n\n"
                          "- activities to increase flexibility \n\n"
                          "- activities that combine more than one type of physical activity, such as aerobic,"
                          " muscle strengthening, and balance training (called “multicomponent” activities",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "If you have a serious health problem like diabetes or heart disease, "
                          "stay aware of how it might limit how much activity you can do safely.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "You can divide your activity throughout the day or week—whatever works best for you."
                          " Studies show that spreading activity across at least 3 days a week can improve your "
                          "health, lower your chances of getting hurt, and keep you from feeling tired.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Many activities give you more than just one benefit! Water aerobics with weights give you both "
                          "aerobic and strengthening benefits. Yoga combines aerobics, balance, flexibility, and"
                          " strengthening. Choose activities you enjoy.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(//----------------Healthy Eating-----------------------------//
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "\nPhysical Activities\n",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/therapy.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20,right:20),
                    child: Text(
                      "How can I become more physically active?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "- Pick an activity you enjoy and start with small goals,"
                          " such as “I will take three 10-minute walks this week. \n\n"
                          "- “Start low and go slow.” Slowly increase the total amount of time"
                          " you are active, the number of days you are active, and the intensity of each activity.\n\n"
                          "- If you live in an assisted-living or retirement facility, ask if the fitness center offers a free health checkup and fitness program.\n\n"
                          "- activities to increase flexibility \n\n"
                          "- Start a walking or other activity group with friends or family members where you live, work, or worship",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Remember to follow these safety tips",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Ask your health care professional about how you can safely increase your physical activity."
                          "- Remember to start slowly and build up to more intense activity over time. \n\n"
                          "- Wear a sturdy pair of shoes."
                          "- Stop exercising if you have pain, become dizzy, or feel short of breath..\n\n"
                          "- Drink fluids.\n\n"
                          "- Do outdoor exercise during daylight hours with a buddy. Be alert when crossing the street.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20,right:20),
                    child: Text(
                      "How can I start or keep up an activity program that works for me?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "You can start slowly and increase your goals as you build your endurance and strength over time. "
                          "For example, you can do arm and leg exercises without weights to get started. As you progress,"
                          " you can add hand-held weights, like soup cans, to improve your strength.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "As you become more fit, try to slowly increase your pace, the length of time you are active,"
                          " and how many days of the week you are active.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left:15, top:20,right:145),
                    child: Text(
                      "Being good to yourself",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Sometimes older adults feel lonely, sad, low, or stressed because of life changes, "
                          "loss of loved ones, health problems, caring for other family members, or financial issues. "
                          "Being good to yourself may help you improve your lifestyle habits, your “get up and go,” "
                          "and your ability to cope with the demands of daily living.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Here are some ideas for being good to yourself",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "- Stay in touch with family, friends, or former coworkers to stay engaged and to keep your spirits up."
                          "- See your health care professional regularly and share any concerns. \n\n"
                          "- Get enough sleep.\n\n"
                          "- Join a walking group or another social group.\n\n"
                          "- If you are retired, pursue a new hobby or volunteer to help keep you active and social.\n\n"
                          "- Surround yourself with people you enjoy.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Remember, it's never too late to improve your eating habits, become more physically active,"
                          " and be good to yourself for a healthier life!",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20, right:20, bottom:20),
                    child: Text(
                      "Talk to your health care professional if you have health concerns",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Changes in your home life, health, medicines, income, and sense of smell and taste may"
                          " affect your interest in consuming healthy food and drinks and physical activity."
                          " Perhaps you have had some of these thoughts about eating and exercise.",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "- The dishes I always liked the most just don't taste the same as they used to.\n\n"
                          "- Now that I live alone, it's too much trouble to cook for one. \n\n"
                          "- I don't feel like going to the store because I might slip and fall.\n\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(//------------------Back Next (New)------------------------//
                    height: 55,
                    width: 250,
                    // height: 50,
                    // width: 280,

                    // margin: EdgeInsets.only(bottom: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: ('OpenSans'),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onPressed: (){
//                        _UserLogin(myEmail.text, password.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PhysicalActContentp2()));
                      },
                    ),
                  ),

                  SizedBox(height: 17),

                  Container(//------------------Back Next------------------------//
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



class PhysicalActContentp2 extends StatelessWidget {
//  final String email;
////  final screenHeight = MediaQuery.of(context).size.height;
//
//  HealthyEatingContent({@required this.email});

//  Home({this.email});

//LoginState login =  LoginState();

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
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
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 5000,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 40,  right: 20),
                    child: Text(
                      "Talk with your health care professional if you",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "- find it hard to chew or swallow or have trouble with your dentures\n\n"
                          "- think your medicines make food taste bad or affect your appetite \n\n"
                          "- think you may need a daily vitamin\n\n"
                          "- have less interest in eating after the death of a loved one or other life event\n\n"
                          "- have fears about being active or going outdoors\n\n"
                          "- have limited funds to shop for food\n\n"
                      ,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  //-----------------------------------------------------------------------------------------------back Next


                  SizedBox(height: 17),
                  Container(//------------------Back Next------------------------//
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PhysicalActContent()));
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