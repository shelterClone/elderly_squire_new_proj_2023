import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = FirebaseAuth.instance.currentUser;

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  // User? _user;
  get email => null;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueGrey,
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
                              // Container(
                              //   margin: EdgeInsets.only(left: 20, top: 150),
                              //   child:
                              //   Text(
                              //       // Display the user's email
                              //       streamSnapshot.data!['First Name'],
                              //       // _user?.email ?? "",
                              //       style: TextStyle(
                              //         fontSize: 24,
                              //         fontFamily: ('OpenSans'),
                              //         // fontWeight: FontWeight.bold,
                              //       )),
                              //
                              // ),
                              Center(
                                child: Container(
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
                                          image: NetworkImage(
                                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'))),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                        Border.all(width: 4, color: Colors.white),
                                        color: Colors.redAccent),
                                    child: Icon(Icons.edit),
                                  )),


                              Container(//--------------------First Name
                                margin: EdgeInsets.only(top: 100,),
                                child: Text(
                                  'Firstname',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: ('OpenSans'),
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                // margin: EdgeInsets.only(left:15, top: 200,),
                                child: Text(
                                  // Display the user's email
                                    streamSnapshot.data!['First Name'],
                                    // _user?.email ?? "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: ('OpenSans'),
                                      fontSize: 15,
                                    )),
                              ),


                              // SizedBox(
                              //   height: 5,
                              // ),

                              SizedBox(
                                height: 30,
                              ),
                              Container(//--------------------Middle Name
                                child: Text(
                                  'Middlename',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: ('OpenSans'),
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent
                                  ),
                                ),
                              ),
                              SizedBox(height:5),
                              Container(
                                // margin: EdgeInsets.only(left:15),
                                child: Text(
                                  // Display the user's email
                                    streamSnapshot.data!['Middle'],
                                    // _user?.email ?? "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: ('OpenSans'),
                                      fontSize: 15,
                                    )),
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Container(//--------------------Last Name

                                child: Text(
                                  'Lastname',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: ('OpenSans'),
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent),
                                ),
                              ),
                              SizedBox(height:5),
                              Container(
                                child: Text(
                                  // Display the user's email
                                    streamSnapshot.data!['Last Name'],
                                    // _user?.email ?? "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: ('OpenSans'),
                                      fontSize: 15,
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(//--------------------Gender
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: ('OpenSans'),
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent),
                                ),
                              ),
                              SizedBox(height:5),
                              Container(
                                child: Text(
                                  // Display the user's email
                                    streamSnapshot.data!['Gender'],
                                    // _user?.email ?? "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: ('OpenSans'),
                                      fontSize: 15,
                                    )),
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Container(//--------------------Email
                                child: Text(
                                  'Email address',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: ('OpenSans'),
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent),
                                ),
                              ),
                              SizedBox(
                                height:5
                              ),
                              Container(
                                child: Text(
                                  // Display the user's email
                                    streamSnapshot.data!['email'],
                                    // _user?.email ?? "",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: ('OpenSans'),
                                      fontSize: 15,
                                    )),
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

// Widget buildImage() {
//   final image = NetworkImage(imagePath);
//
//   return ClipOval(
//     child: Material(
//       color: Colors.transparent,
//       child: Ink.image(
//         image: image,
//         fit: BoxFit.cover,
//         width: 128,
//         height: 128,
//         child: InkWell(onTap: onClicked),
//       ),
//     ),
//   );
// }

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
