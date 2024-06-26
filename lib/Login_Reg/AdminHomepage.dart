import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/AboutUs.dart';
import 'package:elderly_squire_2023_remastered_v2/Announcements(Admin)/AnnouncementsAdmin.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits(Admin)/BenefitsAdmin.dart';
import 'package:elderly_squire_2023_remastered_v2/Chat%20Support/support_page.dart';
import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
// import 'package:elderly_squire_2023_remastered_v2/ID_Registration/ID_Registration.dart';
// import 'package:elderly_squire_2023_remastered_v2/ID_Registration/ID_Registration2.dart';
import 'package:elderly_squire_2023_remastered_v2/ID_Registration/ID_Registration3.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Login.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Login2.dart';
import 'package:elderly_squire_2023_remastered_v2/Medicine%20Reminder/ReminderHome.dart';
import 'package:elderly_squire_2023_remastered_v2/Medicine/MedicineMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/MyProfile/UserProfile.dart';
import 'package:elderly_squire_2023_remastered_v2/News/NewsHome.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/todos.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AdminHomepage extends StatefulWidget {
  @override
  AdminHomepageState createState() =>  AdminHomepageState();
}

class  AdminHomepageState extends State< AdminHomepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = FirebaseAuth.instance.currentUser;

  CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('Users');

  User? _displayemail;
  User? _displayfirstName;

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      // (route) => false,
    );
  }

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.blueGrey[
              900], //This will change the drawer background to blue.
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
                              margin: EdgeInsets.only(
                                  left: 20, top: 30, bottom: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserProfile()));
                                },
                                child: CircleAvatar(
                                  child:
                                  // Icon(
                                  //   Icons.person,
                                  //   color: Colors.white,
                                  // ),
                                  Text(
                                    '${streamSnapshot.data!['First Name'][0]}${streamSnapshot.data!['Last Name'][0]}',
                                    style: TextStyle(
                                      color: Colors.red[900],
                                      // color: Colors.red[200],
                                      fontSize: 19,
                                    ),
                                  ),
                                  maxRadius: 23,
                                  // backgroundColor: Colors.grey[400],
                                  backgroundColor: Colors.redAccent,
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


                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '${streamSnapshot.data!['First Name']}',
                                          style: TextStyle(
                                            overflow: TextOverflow.fade,
                                            fontStyle: FontStyle.normal,
                                            // fontFamily: ('OpenSans'),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // _displayemail?.email ?? 'User',
                                        '${streamSnapshot.data!['email']}',
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
                                  leading:
                                  Icon(Icons.home, color: Colors.white),
                                  title: Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminHomepage()),
                                    );
                                  }),
                              // ListTile(
                              //     leading:
                              //         Icon(Icons.newspaper, color: Colors.white),
                              //     title: Text(
                              //       'News',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => NewsHome()),
                              //       );
                              //     }),

                              // ListTile(//------------------------------Medicine Reminder-------------------------//
                              //     leading:
                              //     Icon(Icons.medication, color: Colors.white),
                              //     title: Text(
                              //       'Medicine Reminder',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => ReminderHome()),
                              //       );
                              //     }),

                              // ListTile(//------------------------------To Do List------------------------//
                              //     leading:
                              //     Icon(Icons.today_outlined, color: Colors.white),
                              //     title: Text(
                              //       'To Do List',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => TodoLanding()),
                              //       );
                              //     }),

                              // ListTile(//------------------------------Chat Support------------------------//
                              //     leading:
                              //     Icon(Icons.chat, color: Colors.white),
                              //     title: Text(
                              //       'Chat Support',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //
                              //
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => SupportPage()),
                              //       );
                              //     }),

                              // ListTile(
                              //     leading:
                              //     Icon(Icons.people, color: Colors.white),
                              //     title: Text(
                              //       'About Us',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => AboutUs()),
                              //       );
                              //     }),
                              // ListTile(
                              //   leading: Icon(Icons.exit_to_app, color: Colors.white),
                              //   title: Text(
                              //     'Log Out',
                              //     style: TextStyle(color: Colors.white,
                              //     ),
                              //   ),
                              //   onTap: () {
                              //
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(builder: (context) => HomeScreen()),
                              //     );
                              //
                              //   },
                              //
                              // )
                              ListTile(
                                leading: Icon(Icons.exit_to_app,
                                    color: Colors.white),
                                title: Text(
                                  'Log Out',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  // Show a confirmation dialog.
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirmation'),
                                        content: Text(
                                            'Are you sure you want to log out?'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog.
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Logout'),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              logout();

                                              // Navigator.pushAndRemoveUntil(
                                              //   context,
                                              //   MaterialPageRoute(builder: (context) => HomeScreen()),
                                              //       (route) => false,
                                              // );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 75,
            // backgroundColor: Colors.blueGrey[900],
            backgroundColor: Colors.purple[500],
            // leading: GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => LoginPage2()));
            //   },
            //   child: Icon(
            //     Icons.arrow_back, // add custom icons also
            //   ),
            // ),
            title: Image.asset('assets/images/elderly_squire_logo_classic.png',
                height: 40, width: 130),
          ),
          body: StreamBuilder<DocumentSnapshot>(
              stream: usersCollection.doc(_user!.uid).snapshots(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: Colors.blue,
                  );
                }
                return Column(children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 130),
                    child: Text(
                      'Hi, ${streamSnapshot.data!['First Name']}!',
                      style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        fontSize: 23,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  GestureDetector(
                    child: Container(
                      height: 120,
                      child: Card(
                        color: Colors.purple[500],
                        // color: Colors.blueGrey[900],
                        //------------------------------Benefits---------------------------------//
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 10, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BenefitsAdminPage()),
                                    );
                                  },
                                  child: Image.asset(
                                      'assets/images/scardbene.png',
                                      height: 75,
                                      width: 90),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 29),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(left: 25),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BenefitsAdminPage()),
                                          );
                                        },
                                        child: Text(
                                          'Benefits',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: ('BebasNeue'),
                                            fontSize: 25,

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
                                                builder: (context) =>
                                                    BenefitsAdminPage()),
                                          );
                                        },
                                        child: Text(
                                          'Senior Citizen Benefits',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: ('OpenSans'),
                                            fontSize: 10,

//                                  fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ))
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
                        color: Colors.purple[500],
                        // color: Colors.blueGrey[900],
                        //------------------Announcements--------------------------------//
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 10, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnnouncementsAdminPage()),
                                    );
                                  },
                                  child: Image.asset(
                                      'assets/images/megaphone.png',
                                      height: 75,
                                      width: 90),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 29),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(left: 25),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AnnouncementsAdminPage()),
                                          );
                                        },
                                        child: Text(
                                          'Announcements',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: ('BebasNeue'),
                                            fontSize: 25,

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
                                                builder: (context) =>
                                                    AnnouncementsAdminPage()),
                                          );
                                        },
                                        child: Text(
                                          'City of Manila Bulletin Board',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: ('OpenSans'),
                                            fontSize: 10,

//                                  fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                ]);
              })

//
      ),
    );
  }
}
