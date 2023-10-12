import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/SelectGender.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Users.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/db_service.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/SelectGender.dart';
import 'dart:core';

class ID_Reg2 extends StatefulWidget {
  get user => null;

  // var user;

  @override
  ID_Reg2State createState() =>  ID_Reg2State();
}

class  ID_Reg2State extends State< ID_Reg2> {


  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");

  TextEditingController firstname = TextEditingController();
  TextEditingController middle = TextEditingController();
  TextEditingController lastname = TextEditingController();
  List<String> applicationtype = ['New Senior(Voter)', 'New Senior(Non-Voter)', 'Old Senior'];
  late TextEditingController selectsex;
  bool ischecked = false;
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  // TextEditingController contactnum = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController nationality = TextEditingController();



  User? _user = FirebaseAuth.instance.currentUser;

  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();



  Future<void> _createUser(
      String firstname,
      String middle,
      String lastname,
      String sex,
      String address,
      String email,
      String password,) async {
    if (validateReg()) {
      try {
        print("Email: $email Password: $password");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: email.characters.toString().trim(), password: password);
        // email: email, password: password);

        await DBServices().saveUser(Users(
          uid: user?.uid,
          firstname: firstname,
          middle: middle,
          lastname: lastname,
          sex: sex,
          address: address,
          email: user?.email,

          // contact_number: contact_number,

        )
        );
        print("User: $userCredential");
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Success"),
                content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text("You are now offically registered!"),
                      ],
                    )),
                actions: <Widget>[
                  TextButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                  )
                ],
              );
            });
      } on FirebaseAuthException catch (e) {
        // print("Error: $e");


      } catch (e) {
        print("Error: $e");
      }
//    }
    }
  }

  User? get user => FirebaseAuth.instance.currentUser;

  void initState() {
    firstname.text = '';
    middle.text = '';
    lastname.text = '';
    selectsex = TextEditingController();
    address.text = '';
    email.text = '';
    age.text = '';
    nationality.text = '';
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
      lastname.dispose();
      selectsex.dispose();
      address.dispose();
      email.dispose();
      age.dispose();
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
              MaterialPageRoute(builder: (context) => Homepage()),
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
          // height: MediaQuery.of(context).size.height + 700, //-----original
          height: MediaQuery.of(context).size.height + 1000,
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
                        child: Image.asset('assets/images/health_consult.png',
                            height: 200)),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Application form for Senior Citizen ID",
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
                          "Application form for Senior Citizen ID",
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
                      'Type of Application',//------------------Type of Application-----------------------//
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

                      margin: EdgeInsets.only(right:40),
                      child: DropdownButtonFormField(
                        hint: Text('Select Application Type',
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
                            return 'Type of Application required';
                          }
                          else {
                            return null;
                          }
                        },
                        items: applicationtype.map((apptype) {
                          return DropdownMenuItem(
                            child: Text(apptype),
                            value: apptype,
                          );
                        }).toList(),

                      ),

                    ),
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
                      'Surname',
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
                        controller: lastname,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Surname Required";
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
                              lastname.selection; //----------new
                          lastname.text = value;
                          lastname.selection =
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
                      'Birthplace',
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
                        //----------------------Birthplace txtField-----------------------------//
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Birthday Required";
                          }
                          // else if (value.isEmpty ||
                          //     !value.contains('@gmail.com')) {
                          //   return "Invalid Email";
                          // }


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
                      height: 5,
                    ),
                    Text(
                      'Date of Birth',
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
                        //----------------------Date of Birth txtField-----------------------------//
                        controller: dateofbirth,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Date of Birth Required";
                          }
                          else {
                            return null;
                          }
                        },

                        onChanged: (value) {
                          TextSelection previousSelection =
                              dateofbirth.selection; //----------new
                          dateofbirth.text = value;
                          dateofbirth.selection =
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
                      'Age',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 200,bottom: 20),
                      child: TextFormField(
                        //----------------------Age txtField-----------------------------//
                        controller: age,
                        validator: (value) {

                          if (value!.length <1) {
                            return "Invalid age";
                          }

                          else if(value.isEmpty){
                            return "Age required";
                          }
                          return null;
                        },
                        // obscureText: true,
                        onChanged: (value) {
                          TextSelection previousSelection =
                              age.selection; //----------new
                          age.text = value;
                          age.selection =
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
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Nationality',
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
                        //----------------------Nationality-----------------------------//
                        controller: nationality,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nationality Required";
                          }

                          else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              nationality.selection; //----------new
                          nationality.text = value;
                          nationality.selection =
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
                          lastname.text,
                          selectsex.text,
                          address.text,
                          email.text,
                          age.text,
                          );

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