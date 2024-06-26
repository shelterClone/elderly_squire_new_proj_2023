import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/RegSuccess.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/SelectGender.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Users.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/db_service.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/SelectGender.dart';
import 'dart:core';

class RegistrationPage extends StatefulWidget {
  get user => null;

  // var user;

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {




  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");

  TextEditingController firstname = TextEditingController();
  TextEditingController middle = TextEditingController();
  TextEditingController surname = TextEditingController();
  List<String> sex = ['Male', 'Female'];
  late TextEditingController selectsex;
  bool ischecked = false;
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController contactnum = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool isPasswordHidden = true;
  String emailError = '';
  // String usernameError = '';
  String passwordError = '';


  User? _user = FirebaseAuth.instance.currentUser;

  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();



  Future<void> _createUser(
      String firstname,
      String middle,
      String surname,
      String sex,
      String address,
      // String email,
      // String email,
      String username,
      String password,) async {
    if (validateReg()) {
      try {
        print("Email: $username Password: $password");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: username.characters.toString().trim(), password: password);
        // email: email, password: password);

        await DBServices().saveUser(Users(
          uid: user?.uid,
          firstname: firstname,
          middle: middle,
          surname: surname,
          sex: sex,
          address: address,
          email: user?.email,
          // username: user?.email,
          password: password
          // contact_number: contact_number,

        )
        );
        print("User: $userCredential");
        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegSuccess()
        )
        );


        // return showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text("Success"),
        //         content: SingleChildScrollView(
        //             child: ListBody(
        //               children: <Widget>[
        //                 Text("You are now offically registered!"),
        //               ],
        //             )),
        //         actions: <Widget>[
        //           TextButton(
        //             child: Text("Close"),
        //             onPressed: () {
        //               Navigator.of(context).pop();
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => Homepage()),
        //               );
        //             },
        //           )
        //         ],
        //       );
        //     });
      }
      on FirebaseAuthException catch (e) {
        // print("Error: $e");
        if (e.code == 'email-already-in-use') {
          setState(() {
            emailError = 'Email address already exist.';
            // usernameError = 'Username already exist.';
            passwordError = '';
          });
        }
        // else if (e.code == 'invalid-email') {
        //   setState(() {
        //     emailError = 'Invalid Email format';
        //     passwordError = '';
        //   });
        // }

      }
      catch (e) {
        // print("Error: $e");
        setState(() {
          emailError = '';
          // usernameError = '';
          passwordError = 'An error occurred: $e';
        });
      }
//    }
    }
  }

  User? get user => FirebaseAuth.instance.currentUser;

  void initState() {
    firstname.text = '';
    middle.text = '';
    surname.text = '';
    selectsex = TextEditingController();
    address.text = '';
    email.text = '';
    // username.text = '';
    password.text = '';
    confirmpassword.text = '';
    // contactnum.text = '';

    super.initState();
  }

  bool validateReg() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    void dispose() {
      firstname.dispose();
      middle.dispose();
      surname.dispose();
      selectsex.dispose();
      address.dispose();
      email.dispose();
      // username.dispose();
      password.dispose();
      confirmpassword.dispose();
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          // height: MediaQuery.of(context).size.height + 500,
          height: MediaQuery.of(context).size.height + 700,
          width: double.infinity,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset('assets/images/volunteer.jpg',
                            height: 200)),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up for your Elderly Squire account",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'First Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        //----------------------Firstname txtField-----------------------------//
                        controller: firstname,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "First Name Required";
                          }
                          // else if (!numReg.hasMatch(value)) {
                          //   return ("Invalid First Name");
                          // } else if (!specialReg.hasMatch(value)) {
                          //   return ("Invalid First Name");
                          // }
                          else {
                            return null;
                          }
                        },

                        onChanged: (value) {
                          TextSelection previousSelection =
                              firstname.selection; //----------new
                          firstname.text = value;
                          firstname.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(

                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    Text(
                      'Middle Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        //----------------------Middle Name txtField-----------------------------//
                        controller: middle,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Middle Name Required";
                          }
                          // else if (!numReg.hasMatch(value)) {
                          //   return "Invalid Middle Name";
                          // }
                          // else if (!specialReg.hasMatch(value)) {
                          //   return "Invalid Middle Name";
                          // }
                          else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              middle.selection; //----------new
                          middle.text = value;
                          middle.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(

                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey))),

                      ),
                    ),
                    Text(
                      'Last Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        //----------------------Last Name txtField-----------------------------//
                        controller: surname,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Last Name Required";
                          }
                          // else if (!numReg.hasMatch(value)) {
                          //   return "Invalid Last Name";
                          // }
                          // else if (!specialReg.hasMatch(value)) {
                          //   return "Invalid Last Name";
                          // }
                          else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              surname.selection; //----------new
                          surname.text = value;
                          surname.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(

                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey))),
                      ),
                    ),

                    Text(
                      'Sex',//---------------------------------Sex------------------------//
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      height:100,
                      margin: EdgeInsets.only(right:150),
                      child: DropdownButtonFormField(
                        hint: Text('Select Sex',
                          style: TextStyle(
                              fontSize: 15
                          ) ,), // Not necessary for Option 1
                        value: selectsex.text.isEmpty ? null :selectsex.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectsex.text = newValue!;
                          });
                        },
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return 'Sex required';
                          }
                          else {
                            return null;
                          }
                        },
                        items: sex.map((sex) {
                          return DropdownMenuItem(
                            child: Text(sex),
                            value: sex,
                          );
                        }).toList(),

                      ),

                    ),

                    Text(
                      'Address',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        // maxLines: 1,

                        //----------------------Address txtField-----------------------------//
                        controller: address,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Address Required";
                          }
//                            else if(!numReg.hasMatch(value)){
//                              return "Invalid Last Name";
//                            }
//                            else if(!specialReg.hasMatch(value)){
//                              return "Invalid Character";
//                            }
                          else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              address.selection; //----------new
                          address.text = value;
                          address.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(

                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey))),
                      ),
                    ),


                    Text(
                      'Email Address',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    // Text(
                    //   'Username',
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w400,
                    //       color: Colors.black87),
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 20),
                    //   child: TextFormField(
                    //     //----------------------Username txtField-----------------------------//
                    //     controller: username,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return "Username Required";
                    //       }
                    //       // else if (value.isEmpty ||
                    //       //     !value.contains('@gmail.com')) {
                    //       //   return "Invalid Email";
                    //       // }
                    //      /* else if (value.isEmpty || !value.contains('@') || !value.contains('.') || !value.contains('.com')) {
                    //         return "Invalid Email";
                    //       }*/
                    //
                    //       else {
                    //         return null;
                    //       }
                    //     },
                    //     onChanged: (value) {
                    //       TextSelection previousSelection =
                    //           username.selection; //----------new
                    //       username.text = value;
                    //       username.selection = previousSelection; //--------------new
                    //     },
                    //
                    //     decoration: InputDecoration(
                    //         errorText: usernameError.isNotEmpty ? usernameError : null,
                    //         contentPadding:
                    //         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.blueGrey),
                    //         ),
                    //         border: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Colors.blueGrey))),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        //----------------------Email Address txtField-----------------------------//
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Required";
                          }
                          // else if (value.isEmpty ||
                          //     !value.contains('@gmail.com')) {
                          //   return "Invalid Email";
                          // }
                          else if (value.isEmpty || !value.contains('@') || !value.contains('.') || !value.contains('.com')) {
                            return "Invalid Email";
                          }

                          else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              email.selection; //----------new
                          email.text = value;
                          email.selection = previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            errorText: emailError.isNotEmpty ? emailError : null,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        //----------------------Password txtField-----------------------------//
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password Required";
                          } else if (value.length < 8) {
                            return "Password must be 8-16 characters";
                          } else if (value.length > 16) {
                            return "Password must be 8-16 characters";
                          } else {
                            return null;
                          }
                        },
                        obscureText: isPasswordHidden,
                        onChanged: (value) {
                          TextSelection previousSelection =
                              password.selection; //----------new
                          password.text = value;
                          password.selection =
                              previousSelection; //--------------new
//
                        },

                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        //----------------------Confirm Password txtField-----------------------------//
                        controller: confirmpassword,
                        validator: (value) {
                          if (password.text.isNotEmpty & confirmpassword.text.isEmpty) {
                            return "Please Re Enter Password";
                          }
                          if (value == null || value.isEmpty) {
                            return "Password Required";
                          }

                          if (password.text != confirmpassword.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (value) {
                          TextSelection previousSelection =
                              confirmpassword.selection; //----------new
                          confirmpassword.text = value;
                          confirmpassword.selection =
                              previousSelection; //--------------new},
                        },

                        decoration: InputDecoration(
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

                //===========================================I agree to blah blah blah===================//

                // Row(
                //   children: [
                //     Checkbox(
                //       value: ischecked,
                //       onChanged: (value) {
                //         setState(() {
                //           ischecked = value!;
                //         });
                //       },
                //     ),
                //     Text('I agree to the Privacy Policy'),
                //   ],
                // ),



                  FormField<bool>(
                    builder: (state) {
                      return Column(
                        children: <Widget>[
                            Container(
                              margin:EdgeInsets.only(top:20)
,                              child: Row(
                                children: <Widget>[
                                   Container(
                                     margin: EdgeInsets.only(right:10),
                                     child: Checkbox(
                                          value: ischecked,
                                          onChanged: (value) {
                                            setState(() {
                                              ischecked = value!;
                                              state.didChange(value);
                                            });
                                          }),
                                   ),

                                  Row(
                                    children: [
                                      Text('I agree to the'),
                                      TextButton(
                                          child: Text('Privacy Policy',
                                              style: TextStyle(
                                                // fontStyle: FontStyle.normal,

                                              )),
                                          onPressed: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> TermsAndConditions()));
                                            PrivacyPolicyDialog(context);



                                          },
                                        ),


                                    ],
                                  ),
                                ],
                              ),
                            ),


                          Text(
                            state.errorText ?? '',
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                            ),
                          )
                        ],
                      );
                    },

                    validator: (value) {
                      if (!ischecked) {
                        return 'You need to accept Privacy Policy';
                      } else {
                        return null;
                      }
                    },
                  ),





                Container(
                  height: 60,
                  width: 330,
                  margin: EdgeInsets.only(top: 20, bottom: 130),
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
                        "Submit",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('OpenSans'),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    onPressed: () {
                      _createUser(
                          firstname.text,
                          middle.text,
                          surname.text,
                          selectsex.text,
                          address.text,
                          email.text,
                          // username.text,
                          password.text);

                    },
                  ),
                ),
//              Container(
//                margin: EdgeInsets.only(bottom:10),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text("Already have an account?"),
//                    Container(
//                      child: Text(" Login", style:TextStyle(
//                          fontWeight: FontWeight.w600,
//                          fontSize: 18
//                      ),
//                      ),
//                    )
//                  ],
//                ),
//              )
//
              ],
            ),
          ),




        ),
      ),
    );
  }
}