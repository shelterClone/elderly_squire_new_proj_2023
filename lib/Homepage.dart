import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/AboutUs.dart';
import 'package:elderly_squire_2023_remastered_v2/Chat%20Support/support_page.dart';
import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/ID_Registration.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Login.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Login2.dart';
import 'package:elderly_squire_2023_remastered_v2/Medicine/MedicineMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/MyProfile/UserProfile.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = FirebaseAuth.instance.currentUser;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  User? _displayemail;
  User? _displayfirstName;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  void _getUserInfo() {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _displayemail = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .blueGrey, //This will change the drawer background to blue.
              //other styles
            ),
            child: StreamBuilder<DocumentSnapshot>(
                stream: usersCollection.doc(_user!.uid).snapshots(),
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  }
                return Drawer(
                  child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 30, bottom: 20),
                            child: GestureDetector(
                              // onTap: ()async{
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
                              // },
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                maxRadius: 23,
                                backgroundColor: Colors.grey[400],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserProfile()));
                              },

                              //    child: new Text('User',
                              // // // email != null ? email.toString : "$email",
                              // //      email != null ? email : 'User',
                              // //   // '${widget.email}',
                              //
                              //      style: TextStyle(
                              //          fontStyle: FontStyle.normal,
                              //          color: Colors.white,
                              //          fontSize: 15),
                              //    ),

                              child: Container(
                                margin: EdgeInsets.only(top:10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${streamSnapshot.data!['First Name']}',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        // fontFamily: ('OpenSans'),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      _displayemail?.email ?? 'User',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontFamily: ('OpenSans'),
                                        color: Colors.grey[200],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 13),
                        child: Column(
                          children: [
                            ListTile(
                                leading: Icon(Icons.home, color: Colors.white),
                                title: Text(
                                  'Home',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Homepage()),
                                  );
                                }),
//                ListTile(
//                    leading: Icon(Icons.settings, color: Colors.white),
//                    title: Text(
//                      'Settings',
//                      style: TextStyle(
//                        color: Colors.white,
//                      ),
//                    ),
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Home()),
//                      );
//                    }),

                            ListTile(
                                leading: Icon(Icons.people, color: Colors.white),
                                title: Text(
                                  'About Us',
                                  style: TextStyle(color: Colors.white,),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AboutUs()),
                                  );
                                }),
                            ListTile(
                              leading: Icon(Icons.exit_to_app, color: Colors.white),
                              title: Text(
                                'Log Out',
                                style: TextStyle(color: Colors.white,),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              },
                            )

                          ],
                        ),
                      ),


                    ],
                  ),
                );
              }
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 75,
//          backgroundColor: Colors.blueGrey[900],
            backgroundColor: Colors.blueGrey,
            // leading: GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => LoginPage2()));
            //   },
            //   child: Icon(
            //     Icons.arrow_back, // add custom icons also
            //   ),
            // ),
            title: Image.asset('assets/images/elderly_squire_logo_2023.png',
                height: 40, width: 130),
          ),
          body: Column(children: <Widget>[
            GestureDetector(
              child: Container(
                height: 150,
                child: Card(
                  //------------------------------ID Registration---------------------------------//
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
                                    builder: (context) => ID_Reg()),
                              );
                            },
                            child: Image.asset('assets/images/ID.png',
                                height: 600, width: 90),
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
                                        builder: (context) => ID_Reg()),
                                  );
                                },
                                child: Text(
                                  'ID Registration',
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
                  //------------------------------Medicine Menu---------------------------------//
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
                                    builder: (context) => MedicineMenu()),
                              );
                            },
                            child: Image.asset('assets/images/medicine.png',
                                height: 600, width: 90),
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
                                        builder: (context) => MedicineMenu()),
                                  );
                                },
                                child: Text(
                                  'Medicine',
                                  style: TextStyle(
                                      fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                      ),
                                ),
                              )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              '(Description)',
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
                  //------------------------------Health Tips Menu---------------------------------//
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
                                    builder: (context) => HealthTipsMenu()),
                              );
                            },
                            child: Image.asset('assets/images/healthy.png',
                                height: 600, width: 90),
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
                                        builder: (context) => HealthTipsMenu()),
                                  );
                                },
                                child: Text(
                                  'Health Tips',
                                  style: TextStyle(
                                      fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                      ),
                                ),
                              )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              '(Description)',
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
                  //------------------------------Chat Support---------------------------------//
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
                                    builder: (context) => SupportPage()),
                              );
                            },
                            child: Image.asset('assets/images/chat2.png',
                                height: 600, width: 90),
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
                                        builder: (context) => SupportPage()),
                                  );
                                },
                                child: Text(
                                  'Chat Support',
                                  style: TextStyle(
                                      fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                      ),
                                ),
                              )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              '(Description)',
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
          ])

//
          ),
    );
  }
}
