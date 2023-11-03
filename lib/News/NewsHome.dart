import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/AboutUs.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/MyProfile/UserProfile.dart';
import 'package:elderly_squire_2023_remastered_v2/News/News1.dart';
import 'package:elderly_squire_2023_remastered_v2/News/News2.dart';
import 'package:elderly_squire_2023_remastered_v2/News/News3.dart';
import 'package:elderly_squire_2023_remastered_v2/News/News4.dart';
import 'package:elderly_squire_2023_remastered_v2/News/News5.dart';
import 'package:elderly_squire_2023_remastered_v2/News/news_model.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';

class NewsHome extends StatefulWidget {
  NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {

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
          body: ListView.builder(
            itemCount:1,
            itemBuilder: (_, index) =>
                Column(
                  children: [
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Container(
                    //       margin: EdgeInsets.only(top:20, bottom:5,left:20),
                    //       child: Text('NEWS',
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold
                    //
                    //         ),
                    //       )
                    //   ),
                    // ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:20,top:20,right:130,bottom:10),

                          child: Text(
                            'News',
                            style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              fontSize: 23,
                              // fontFamily: ('OpenSans'),
                              fontFamily: ('BebasNeue'),
                            ),
                          ),
                        ),


                        Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left:10,right:200,bottom: 20),
                              child: Divider(
                                color: Colors.black54,
                              ),
                            )
                        ),
                      ],
                    ),
                    Container(
                      height: 250,

                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [


                            GestureDetector(
                              child: Container(

                                decoration: BoxDecoration(

                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      '${newslist[0]['image']}',

                                    ),

                                  ),

                                ),
                              ),
                              onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => News1()),
                                  );

                              }
                            ),
                            GestureDetector(


                              child: Container(
                                color: Colors.black.withOpacity(0.7), // Adjust the opacity as needed
                              ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => News1()),
                                  );

                                }
                            ),

                            Container(

                              margin: EdgeInsets.only(left:20,bottom:10),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [

                                  GestureDetector(
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   boxShadow: [
                                      //     BoxShadow(
                                      //       color: Colors.black.withOpacity(0.5), // Shadow color
                                      //       // spreadRadius: 0.5, // Spread radius
                                      //       blurRadius: 8, // Blur radius
                                      //       offset: Offset(0, 2), // Offset
                                      //     ),
                                      //   ],
                                      //
                                      // ),
                                      child: Text(
                                        '${newslist[0]['title']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,

                                        ),
                                      ),
                                    ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => News1()),
                                        );

                                      }
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                      ),
                    ),

                    Container(//-------------1----------------------------//
                      height: 250,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [

                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(

                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      '${newslist[1]['image']}',

                                    ),

                                  ),

                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News2()),
                                );
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                  color: Colors.black.withOpacity(0.7) // Adjust the opacity as needed
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News2()),
                                );
                              },
                            ),

                            Container(
                              margin: EdgeInsets.only(left:20,bottom:10),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [


                                  GestureDetector(
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   boxShadow: [
                                      //     BoxShadow(
                                      //       color: Colors.black.withOpacity(0.2), // Shadow color
                                      //       // spreadRadius: 0.5, // Spread radius
                                      //       blurRadius: 5, // Blur radius
                                      //       offset: Offset(0, 2), // Offset
                                      //     ),
                                      //   ],
                                      //
                                      // ),
                                      child: Text(
                                        '${newslist[1]['title']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,

                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => News2()),
                                      );
                                    },
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),




                          ],
                        ),

                      ),
                    ),

                    Container(//-------------2----------------------------//
                      height: 250,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [

                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      '${newslist[2]['image']}',

                                    ),

                                  ),

                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News3()),
                                );
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                  color: Colors.black.withOpacity(0.7) // Adjust the opacity as needed
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News3()),
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(left:20,bottom:10),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [

                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black.withOpacity(0.5), // Shadow color
                                        //     // spreadRadius: 0.5, // Spread radius
                                        //     blurRadius: 8, // Blur radius
                                        //     offset: Offset(0, 2), // Offset
                                        //   ),
                                        // ],

                                      ),
                                      child: Text(
                                        '${newslist[2]['title']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,

                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => News3()),
                                      );
                                    },
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),




                          ],
                        ),

                      ),
                    ),

                    Container(//-------------3----------------------------//
                      height: 250,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [

                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      '${newslist[3]['image']}',

                                    ),

                                  ),

                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News4()),
                                );
                              },
                            ),

                            GestureDetector(
                              child: Container(
                                  color: Colors.black.withOpacity(0.7) // Adjust the opacity as needed
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News4()),
                                );
                              },
                            ),

                            Container(
                              margin: EdgeInsets.only(left:20,bottom:10),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [

                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black.withOpacity(0.5), // Shadow color
                                        //     // spreadRadius: 0.5, // Spread radius
                                        //     blurRadius: 8, // Blur radius
                                        //     offset: Offset(0, 2), // Offset
                                        //   ),
                                        // ],

                                      ),
                                      child: Text(
                                        '${newslist[3]['title']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,

                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => News4()),
                                      );
                                    },
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),




                          ],
                        ),

                      ),
                    ),

                    Container(//-------------4----------------------------//
                      height: 250,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [


                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      '${newslist[4]['image']}',

                                    ),

                                  ),

                                ),
                              ),

                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News5()),
                                );
                              },

                            ),
                            GestureDetector(
                              child: Container(
                                  color: Colors.black.withOpacity(0.7) // Adjust the opacity as needed
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => News5()),
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(left:20,bottom:10),
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [

                                  GestureDetector(
                                    child: Container(

                                      decoration: BoxDecoration(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black.withOpacity(0.5), // Shadow color
                                        //     // spreadRadius: 0.5, // Spread radius
                                        //     blurRadius: 8, // Blur radius
                                        //     offset: Offset(0, 2), // Offset
                                        //   ),
                                        // ],

                                      ),
                                      child: Text(
                                        '${newslist[4]['title']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,

                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => News5()),
                                      );
                                    },
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),




                          ],
                        ),

                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top:280),
                      margin: EdgeInsets.only(top:40, bottom:40),
                      height: 50,
                      width: 250,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));

                        },

                      ),
                    ),







                  ],
                ),
          )),
    );
  }
}