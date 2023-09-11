import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  // final String email;
  // final String name;
  // UserProfile({@required this.email, this.name});



  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  bool isObscurePassword = true;
  User? _user;

  get email => null;
  get firstname => null;
  @override
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




  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.blueGrey,
        title: new Text(
          // widget.email != null? widget.email :
          'User',
        ),
        leading: IconButton(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
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
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 30),
                buildTextField("Full Name", _user?.displayName ??  "", false),
                buildTextField("Email", _user?.email ?? "", false),
                buildTextField("Password", "********", true),
                buildTextField("Location", "", false),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Cancel",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("SAVE",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    })
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
