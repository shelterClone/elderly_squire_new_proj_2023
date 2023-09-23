import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/MyProfile/EditUserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = FirebaseAuth.instance.currentUser;
  File? _profilePicFile;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  // User? _user;
  // get email => null;

  void initState() {

    _getUserInfo();
    super.initState();
     // Fetch the user information when the page is initialized.
  }

  void _getUserInfo() {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  // Future<void> _directUpdateImage(File? file) async {
  //   if (file == null) return;
  //
  //   setState(() {
  //     _profilePicFile = file;
  //   });
  // }
  //





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueGrey[900],
          title: Text('My Profile'),
        ),
        body: Center(
          child: StreamBuilder<DocumentSnapshot>(
              stream: usersCollection.doc(_user!.uid).snapshots(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: Colors.blue,
                  );
                }
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(

                      // height: 2445,
                      height: 1100,
                      width: 1000,
                      child: Card(
                        margin: EdgeInsets.all(20),
                        elevation: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top:50),
                                  child: CircleAvatar(
                                    child:
                                    // Icon(
                                    //   Icons.person,size: 60,
                                    //   color: Colors.white,
                                    // ),

                                    Text(
                                      '${streamSnapshot.data!['First Name'][0]}${streamSnapshot.data!['Last Name'][0]}',
                                      style: TextStyle(
                                        color: Colors.red[900],
                                        fontSize: 40
                                      ),
                                    ),
                                    // maxRadius: 23,
                                    maxRadius: 50,
                                    backgroundColor: Colors.redAccent,
                                    // backgroundColor: Colors.grey[400],
                                  ),
                                ),


                              ),

                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                          '${streamSnapshot.data!['First Name']}',
                                        style: TextStyle(
                                            fontFamily: ('Montserrat'),

                                            fontSize: 27,
                                            ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),








                              SizedBox(
                                height: 50,
                              ),


                              Text( //----------------------Firstname txtField-----------------------------//
                                'Firstname',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(
                                    enabled: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText:  '${streamSnapshot.data!['First Name']}',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: ('OpenSans'),
                                        fontSize: 15,

                                  ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Text( //----------------------Middlename txtField-----------------------------//
                                'Middlename',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(


                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText:  '${streamSnapshot.data!['Middle']}',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: ('OpenSans'),
                                        fontSize: 15,

                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Text( //----------------------Lastname txtField-----------------------------//
                                'Surname',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(


                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText:  '${streamSnapshot.data!['Last Name']}',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: ('OpenSans'),
                                        fontSize: 15,

                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                ),
                              ),
                              SizedBox(height: 10),

                              Text( //----------------------Gender txtField-----------------------------//
                                'Gender',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(


                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText:  '${streamSnapshot.data!['Gender']}',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: ('OpenSans'),
                                        fontSize: 15,

                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                ),
                              ),

                              SizedBox(height: 10),

                              Text( //----------------------Address txtField-----------------------------//
                                'Address',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(


                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.home),
                                      hintText:  '${streamSnapshot.data!['Address']}',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: ('OpenSans'),
                                        fontSize: 15,

                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                ),
                              ),

                              SizedBox(height: 10),

                              Text( //----------------------Email txtField-----------------------------//
                                'Email Address',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextFormField(


                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail),
                                      hintText:  '${streamSnapshot.data!['email']}',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: ('OpenSans'),
                                        fontSize: 15,

                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.blueGrey))),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top:30),
                                height: 60,
                                width: 330,
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
                                      "Edit Profile",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: ('OpenSans'),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditUserProfile()));

                                  },

                                ),
                              ),










                            ],





                          ),
                        ),
                      ),
                    ));
              }),
        ));
  }
}



