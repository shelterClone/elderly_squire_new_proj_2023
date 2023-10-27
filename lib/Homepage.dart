import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/AboutUs.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits/Benefits_P1/BenefitsMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/Chat%20Support/support_page.dart';
import 'package:elderly_squire_2023_remastered_v2/Health_Tips/HealthTipsMenu.dart';
import 'package:elderly_squire_2023_remastered_v2/ID_Registration/ID_Registration.dart';
import 'package:elderly_squire_2023_remastered_v2/ID_Registration/ID_Registration2.dart';
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
              canvasColor: Colors
                  .blueGrey[900], //This will change the drawer background to blue.
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
                              onTap: ()async{
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
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
                              leading: Icon(Icons.exit_to_app, color: Colors.white),
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
                                      content: Text('Are you sure you want to log out?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog.
                                          },
                                        ),
                                       TextButton(
                                          child: Text('Logout'),
                                          onPressed: () async{
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
              }
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 75,
         backgroundColor: Colors.blueGrey[900],
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
            builder: (context,streamSnapshot) {
              if (streamSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return CircularProgressIndicator(
                  color: Colors.blue,
                );
              }
              return Column(children: <Widget>[

                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(right:130),

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
                      // color: Colors.indigo,
                      color: Colors.blue[500],
                      //------------------------------ID Registration---------------------------------//
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 30,bottom:10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ID_Reg2()),
                                  );
                                },
                                child: Image.asset('assets/images/ID.png',
                                    height: 75, width: 90),
                              )),
                          Container(
                            margin: EdgeInsets.only(left:15,top:29),
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
                                              builder: (context) => ID_Reg2()),
                                        );
                                      },
                                      child: Text(
                                        'ID Registration',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: ('BebasNeue'),
                                          // fontFamily: ('OpenSans'),
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
                                              builder: (context) => ID_Reg2()),
                                        );
                                      },
                                      child: Text(
                                        'Application for Senior Citizens ID',
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
                      color: Colors.teal[400],
                      // color: Colors.blueGrey[900],
                      //------------------------------Medicine New---------------------------------//
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 30,bottom:10,top:10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MedicineMenu()),
                                  );
                                },
                                child: Image.asset('assets/images/medicine.png',
                                    height: 75, width: 90),
                              )),

                          Container(
                            margin: EdgeInsets.only(left:15,top:29),
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
                                              builder: (context) => MedicineMenu()),
                                        );
                                      },
                                      child: Text(
                                        'Medicine',
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
                                              builder: (context) => MedicineMenu()),
                                        );
                                      },
                                      child: Text(
                                        'Medicine Reminder, To-do List',
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
                      color: Colors.orange[400],
                      // color: Colors.blueGrey[900],
                      //------------------------------Health Tips---------------------------------//
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 30,bottom:10,top:10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HealthTipsMenu()),
                                  );
                                },
                                child: Image.asset('assets/images/healthy.png',
                                    height: 75, width: 90),
                              )),
                          Container(
                            margin: EdgeInsets.only(left:15,top:29),
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
                                              builder: (context) => HealthTipsMenu()),
                                        );
                                      },
                                      child: Text(
                                        'Health Tips',
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
                                              builder: (context) => HealthTipsMenu()),
                                        );
                                      },
                                      child: Text(
                                        'Health Weight, Healthy Eating etc.',
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
                      color: Colors.brown[400],
                      // color: Colors.blueGrey[900],
                      //------------------------------Benefits---------------------------------//
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 30,bottom:10,top: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BenefitsMenu()),
                                  );
                                },
                                child: Image.asset('assets/images/scardbene.png',
                                    height: 75, width: 90),
                              )),
                          Container(
                            margin: EdgeInsets.only(left:15,top:29),
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
                                              builder: (context) => BenefitsMenu()),
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
                                              builder: (context) => BenefitsMenu()),
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
                      color: Colors.purple[400],
                      // color: Colors.blueGrey[900],
                      //------------------------------Chat Support---------------------------------//
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 30,bottom:10,top:10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SupportPage()),
                                  );
                                },
                                child: Image.asset('assets/images/chat2.png',
                                    height: 75, width: 90),
                              )),
                          Container(
                            margin: EdgeInsets.only(left:15,top:29),
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
                                              builder: (context) => SupportPage()),
                                        );
                                      },
                                      child: Text(
                                        'Chat Support',
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
                                              builder: (context) => SupportPage()),
                                        );
                                      },
                                      child: Text(
                                        'Elderly Squire Customer Care',
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
//             GestureDetector(
//               child: Container(
//                 height: 150,
//                 child: Card(
//                   color: Colors.blueGrey[900],
//                   //------------------------------Medicine Menu---------------------------------//
//                   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                           margin: EdgeInsets.only(left: 30),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => MedicineMenu()),
//                               );
//                             },
//                             child: Image.asset('assets/images/medicine.png',
//                                 height: 600, width: 90),
//                           )),
//                       Column(
//                         children: <Widget>[
//                           Container(
//                               margin: EdgeInsets.only(top: 51, left: 25),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => MedicineMenu()),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Medicine',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                     fontFamily: ('BebasNeue'),
//                                     fontSize: 25,
//
// //                                  fontWeight: FontWeight.bold
//                                       ),
//                                 ),
//                               )),
// //                        Container(
// //                            margin: EdgeInsets.only(top: 5),
// //                            child: Text(
// //                              '(Description)',
// //                              style: TextStyle(
// //                                fontFamily: ('OpenSans'),
// //                                fontSize: 14,
// //
// ////                                  fontWeight: FontWeight.bold
// //                              ),
// //                            ))
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               child: Container(
//                 height: 150,
//                 child: Card(
//                   color: Colors.blueGrey[900],
//                   //------------------------------Health Tips Menu---------------------------------//
//                   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                           margin: EdgeInsets.only(left: 30),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => HealthTipsMenu()),
//                               );
//                             },
//                             child: Image.asset('assets/images/healthy.png',
//                                 height: 600, width: 90),
//                           )),
//                       Column(
//                         children: <Widget>[
//                           Container(
//                               margin: EdgeInsets.only(top: 51, left: 25),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => HealthTipsMenu()),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Health Tips',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                     fontFamily: ('BebasNeue'),
//                                     fontSize: 25,
//
// //                                  fontWeight: FontWeight.bold
//                                       ),
//                                 ),
//                               )),
// //                        Container(
// //                            margin: EdgeInsets.only(top: 5),
// //                            child: Text(
// //                              '(Description)',
// //                              style: TextStyle(
// //                                fontFamily: ('OpenSans'),
// //                                fontSize: 14,
// //
// ////                                  fontWeight: FontWeight.bold
// //                              ),
// //                            ))
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               child: Container(
//                 height: 150,
//                 child: Card(
//                   color: Colors.blueGrey[900],
//                   //------------------------------Chat Support---------------------------------//
//                   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                           margin: EdgeInsets.only(left: 30),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SupportPage()),
//                               );
//                             },
//                             child: Image.asset('assets/images/chat2.png',
//                                 height: 600, width: 90),
//                           )),
//                       Column(
//                         children: <Widget>[
//                           Container(
//                               margin: EdgeInsets.only(top: 51, left: 25),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => SupportPage()),
//                                   );
//                                 },
//                                 child: Text(
//
//                                   'Chat Support',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                     fontFamily: ('BebasNeue'),
//                                     fontSize: 25,
//
// //                                  fontWeight: FontWeight.bold
//                                       ),
//                                 ),
//                               )),
// //                        Container(
// //                            margin: EdgeInsets.only(top: 5),
// //                            child: Text(
// //                              '(Description)',
// //                              style: TextStyle(
// //                                fontFamily: ('OpenSans'),
// //                                fontSize: 14,
// //
// ////                                  fontWeight: FontWeight.bold
// //                              ),
// //                            ))
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
              ]);
            }
          )

//
          ),
    );
  }
}


