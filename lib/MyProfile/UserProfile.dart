import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:editable_image/editable_image.dart';

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
    super.initState();
    _getUserInfo(); // Fetch the user information when the page is initialized.
  }

  void _getUserInfo() {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  Future<void> _directUpdateImage(File? file) async {
    if (file == null) return;

    setState(() {
      _profilePicFile = file;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueGrey[900],
          title: Text('User Profile'),
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

                      height: 2445,
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
                                  margin: EdgeInsets.only(top:70),
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 4, color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color: Colors.black.withOpacity(0.1))
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          // image: NetworkImage(
                                          //     'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                          // )

                                        image: NetworkImage(
                                            'https://imgs.search.brave.com/MA9xaqgtgwXJ9pNckYQHGlTk56d9wmB2t-xfD1fBzzg/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1pY29uL3Vz/ZXJfMzE4LTE1OTcx/MS5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
                                        )
                                      )),
                                ),

                              ),
                              // Container(
                              //   margin: EdgeInsets.only(top:50),
                              //   child: Center(
                              //     child: EditableImage( //----------------------------------------Avatar
                              //       // Define the method that will run on
                              //       // the change process of the image.
                              //       onChange: _directUpdateImage,
                              //
                              //       // Define the source of the image.
                              //       image: _profilePicFile != null
                              //           ? Image.file(_profilePicFile!, fit: BoxFit.cover)
                              //           : null,
                              //
                              //       // Define the size of EditableImage.
                              //       size: 150,
                              //
                              //       // Define the Theme of image picker.
                              //       imagePickerTheme: ThemeData(
                              //         // Define the default brightness and colors.
                              //         primaryColor: Colors.blueGrey,
                              //         shadowColor: Colors.transparent,
                              //         colorScheme:
                              //         const ColorScheme.dark(background: Colors.white70),
                              //         iconTheme: const IconThemeData(color: Colors.black87),
                              //
                              //         // Define the default font family.
                              //         fontFamily: 'OpenSans MS',
                              //       ),
                              //
                              //       // Define the border of the image if needed.
                              //       imageBorder: Border.all(color: Colors.grey, width: 1),
                              //
                              //       // Define the border of the icon if needed.
                              //       editIconBorder: Border.all(color: Colors.grey, width: 1),
                              //     ),
                              //   ),
                              // ),
                              //

                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                          '${streamSnapshot.data!['First Name']}',
                                        style: TextStyle(
                                            fontFamily: ('OpenSans'),
                                            fontSize: 27,
                                            ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),







                              // Container(//--------------------First Name
                              //   margin: EdgeInsets.only(top: 50,),
                              //   child: Text(
                              //     'Firstname',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontFamily: ('OpenSans'),
                              //         fontWeight: FontWeight.w700,
                              //         color: Colors.black54),
                              //   ),
                              // ),
                              // SizedBox(height: 5),
                              // Container(
                              //   // margin: EdgeInsets.only(left:15, top: 200,),
                              //   child: Text(
                              //     // Display the user's email
                              //       streamSnapshot.data!['First Name'],
                              //       // _user?.email ?? "",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //         fontFamily: ('OpenSans'),
                              //         fontSize: 15,
                              //       )),
                              // ),
                              //
                              //
                              // // SizedBox(
                              // //   height: 5,
                              // // ),
                              //
                              // SizedBox(
                              //   height: 30,
                              // ),
                              // Container(//--------------------Middle Name
                              //   child: Text(
                              //     'Middlename',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontFamily: ('OpenSans'),
                              //         fontWeight: FontWeight.w700,
                              //         color: Colors.black54
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height:5),
                              // Container(
                              //   // margin: EdgeInsets.only(left:15),
                              //   child: Text(
                              //     // Display the user's email
                              //       streamSnapshot.data!['Middle'],
                              //       // _user?.email ?? "",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //         fontFamily: ('OpenSans'),
                              //         fontSize: 15,
                              //       )),
                              // ),
                              //
                              // SizedBox(
                              //   height: 30,
                              // ),
                              // Container(//--------------------Last Name
                              //
                              //   child: Text(
                              //     'Lastname',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontFamily: ('OpenSans'),
                              //         fontWeight: FontWeight.w700,
                              //         color: Colors.black54),
                              //   ),
                              // ),
                              // SizedBox(height:5),
                              // Container(
                              //   child: Text(
                              //     // Display the user's email
                              //       streamSnapshot.data!['Last Name'],
                              //       // _user?.email ?? "",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //         fontFamily: ('OpenSans'),
                              //         fontSize: 15,
                              //       )),
                              // ),
                              // SizedBox(
                              //   height: 30,
                              // ),
                              // Container(//--------------------Gender
                              //   child: Text(
                              //     'Gender',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontFamily: ('OpenSans'),
                              //         fontWeight: FontWeight.w700,
                              //         color: Colors.black54
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height:5),
                              // Container(
                              //   child: Text(
                              //     // Display the user's email
                              //       streamSnapshot.data!['Gender'],
                              //       // _user?.email ?? "",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //         fontFamily: ('OpenSans'),
                              //         fontSize: 15,
                              //       )),
                              // ),
                              //
                              // SizedBox(
                              //   height: 30,
                              // ),
                              // Container(//--------------------Email
                              //   child: Text(
                              //     'Email address',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontFamily: ('OpenSans'),
                              //         fontWeight: FontWeight.w700,
                              //         color: Colors.black54),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height:5
                              // ),
                              // Container(
                              //   child: Text(
                              //     // Display the user's email
                              //       streamSnapshot.data!['email'],
                              //       // _user?.email ?? "",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //         fontFamily: ('OpenSans'),
                              //         fontSize: 15,
                              //       )
                              //   ),
                              // ),

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










                            ],
                          ),
                        ),
                      ),
                    ));
              }),
        ));
  }
}



