import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/SelectGender.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Users.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/db_service.dart';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/MongoDbModel.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/SelectGender.dart';
import 'dart:core';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/MongoDbModel.dart';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/mongoDb.dart';

class ID_Reg2 extends StatefulWidget {
  get user => null;

  // var user;

  @override
  ID_Reg2State createState() => ID_Reg2State();
}

class ID_Reg2State extends State<ID_Reg2> {
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");

  List<String> applicationtype = [
    'New Senior(Voter)',
    'New Senior(Non-Voter)',
    'Old Senior'
  ];
  late TextEditingController selectapptype;

  TextEditingController surname = TextEditingController();

  TextEditingController firstname = TextEditingController();

  TextEditingController middle = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController yearsodresidence = TextEditingController();

  TextEditingController birthplace = TextEditingController();

  TextEditingController dateofbirth = TextEditingController();

  List<String> sex = ['Male', 'Female'];
  late TextEditingController selectsex;

  TextEditingController nationality = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController brgy = TextEditingController();

  TextEditingController zone = TextEditingController();

  List<String> district = [
    'District 1',
    'District 2',
    'District 3',
    'District 4',
    'District 5',
    'District 6'
  ];
  late TextEditingController selectdistrict;

  TextEditingController status = TextEditingController();

  TextEditingController phonenum = TextEditingController();

  TextEditingController pension = TextEditingController();

  TextEditingController salary = TextEditingController();

  TextEditingController work = TextEditingController();

  List<String> id = [
    'Passport ID',
    'Voter\'s ID',
    'SSS ID',
    'Umid ID',
    'Police Clearance',
    'NBI Clearance',
    'National ID'
  ];
  late TextEditingController selectid;

  TextEditingController email = TextEditingController();

  bool ischecked = false;

  // User? _user = FirebaseAuth.instance.currentUser;
  //
  // final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   Future<void> _createUser( //-----------------------Create User Firebase------------------------------//
//       String firstname,
//       String middle,
//       String surname,
//       String sex,
//       String address,
//       String email,
//       String password,) async {
//     if (validateReg()) {
//       try {
//         print("Email: $email Password: $password");
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//             email: email.characters.toString().trim(), password: password);
//         // email: email, password: password);
//
//         await DBServices().saveUser(Users(
//           uid: user?.uid,
//           firstname: firstname,
//           middle: middle,
//           surname: surname,
//           sex: sex,
//           address: address,
//           email: user?.email,
//
//           // contact_number: contact_number,
//
//         )
//         );
//         print("User: $userCredential");
//         return showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text("Success"),
//                 content: SingleChildScrollView(
//                     child: ListBody(
//                       children: <Widget>[
//                         Text("You are now offically registered!"),
//                       ],
//                     )),
//                 actions: <Widget>[
//                   TextButton(
//                     child: Text("Close"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Homepage()),
//                       );
//                     },
//                   )
//                 ],
//               );
//             });
//       } on FirebaseAuthException catch (e) {
//         // print("Error: $e");
//
//
//       } catch (e) {
//         print("Error: $e");
//       }
// //    }
//     }
//   }

  // User? get user => FirebaseAuth.instance.currentUser;

  void initState() {
    selectapptype = TextEditingController();
    surname.text = '';
    firstname.text = '';
    middle.text = '';
    address.text = '';
    yearsodresidence.text = '';
    birthplace.text = '';
    dateofbirth.text = '';
    selectsex = TextEditingController();
    nationality.text = '';
    age.text = '';
    brgy.text = '';
    zone.text = '';
    selectdistrict = TextEditingController();
    selectid = TextEditingController();
    status.text = '';
    phonenum.text = '';
    pension.text = '';
    salary.text = '';
    work.text = '';
    selectid = TextEditingController();
    email.text = '';

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
      selectapptype.dispose();
      surname.dispose();
      firstname.dispose();
      middle.dispose();
      address.dispose();
      yearsodresidence.dispose();
      birthplace.dispose();
      dateofbirth.dispose();
      selectsex.dispose();
      nationality.dispose();
      age.dispose();
      brgy.dispose();
      zone.dispose();
      selectdistrict.dispose();
      selectid.dispose();
      status.dispose();
      email.dispose();

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
          height: MediaQuery.of(context).size.height + 2050,
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
                      margin: EdgeInsets.only(bottom: 60),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Application form for Senior Citizen ID",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Type of Application', //------------------Type of Application-----------------------//
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 80,
                      margin: EdgeInsets.only(right: 40),
                      child: DropdownButtonFormField(
                        hint: Text(
                          'Select Application Type',
                          style: TextStyle(fontSize: 15),
                        ), // Not necessary for Option 1
                        value: selectapptype.text.isEmpty
                            ? null
                            : selectapptype.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectapptype.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Type of Application required';
                          } else {
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
                    SizedBox(
                      height: 5,
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
                        //----------------------Surname txtField-----------------------------//
                        controller: surname,
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
                              surname.selection; //----------new
                          surname.text = value;
                          surname.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
//
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Years of Residence',
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

                        //----------------------Years of Residence txtField-----------------------------//
                        controller: yearsodresidence,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Address Required";
                          }
//
                          else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              yearsodresidence.selection; //----------new
                          yearsodresidence.text = value;
                          yearsodresidence.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                        controller: birthplace,
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
                              birthplace.selection; //----------new
                          birthplace.text = value;
                          birthplace.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
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
                          } else {
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sex', //----------Sex---------//
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 80,
                      margin: EdgeInsets.only(right: 40),
                      child: DropdownButtonFormField(
                        hint: Text(
                          'Select Sex',
                          style: TextStyle(fontSize: 15),
                        ),
                        value: selectsex.text.isEmpty ? null : selectsex.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectsex.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Sex required';
                          } else {
                            return null;
                          }
                        },
                        items: sex.map((apptype) {
                          return DropdownMenuItem(
                            child: Text(apptype),
                            value: apptype,
                          );
                        }).toList(),
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
                          } else {
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                      margin: EdgeInsets.only(right: 200, bottom: 20),
                      child: TextFormField(
                        //----------------------Age txtField-----------------------------//
                        controller: age,
                        validator: (value) {
                          if (value!.length < 1 || value!.length > 100) {
                            return "Invalid age";
                          } else if (value.isEmpty) {
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Barangay',
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
                        //----------------------Barangay----------------------------//
                        controller: brgy,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Barangay Required";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              brgy.selection; //----------new
                          brgy.text = value;
                          brgy.selection =
                              previousSelection; //--------------new
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Zone',
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
                        //----------------------Zone----------------------------//
                        controller: zone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Zone Required";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              zone.selection; //----------new
                          zone.text = value;
                          zone.selection =
                              previousSelection; //--------------new
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'District', //----------District---------//
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(right: 100),
                      child: DropdownButtonFormField(
                        hint: Text(
                          'Select District',
                          style: TextStyle(fontSize: 15),
                        ),
                        value: selectdistrict.text.isEmpty
                            ? null
                            : selectdistrict.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectdistrict.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'District required';
                          } else {
                            return null;
                          }
                        },
                        items: district.map((dist) {
                          return DropdownMenuItem(
                            child: Text(dist),
                            value: dist,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Civil Status',
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
                        //----------------------Civil Status----------------------------//
                        controller: status,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Civil Status Required";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              status.selection; //----------new
                          status.text = value;
                          status.selection =
                              previousSelection; //--------------new
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Phone Number',
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
                        //----------------------Phone Number----------------------------//
                        keyboardType: TextInputType.number,
                        controller: phonenum,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone Number Required";
                          }
                          if (value.length > 11 || value.length < 11) {
                            return "Invalid Phone Number";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection = phonenum.selection;
                          phonenum.text = value;
                          phonenum.selection = previousSelection;
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Monthly Pension',
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
                        //----------------------Monthly Pension----------------------------//
                        keyboardType: TextInputType.number,
                        controller: pension,
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Monthly Required";
                          // }
                          // if (value.length >11 || value.length <11) {
                          //   return "Invalid Phone Number";
                          // }
                          //
                          // else {
                          //   return null;
                          // }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection = pension.selection;
                          pension.text = value;
                          pension.selection = previousSelection;
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Salary',
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
                        //----------------------Salary----------------------------//
                        keyboardType: TextInputType.number,
                        controller: salary,
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Monthly Required";
                          // }
                          // if (value.length >11 || value.length <11) {
                          //   return "Invalid Phone Number";
                          // }
                          //
                          // else {
                          //   return null;
                          // }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection = salary.selection;
                          salary.text = value;
                          salary.selection = previousSelection;
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Present Work',
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
                        //----------------------Present Work----------------------------//
                        controller: work,
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Monthly Required";
                          // }
                          // if (value.length >11 || value.length <11) {
                          //   return "Invalid Phone Number";
                          // }
                          //
                          // else {
                          //   return null;
                          // }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection = work.selection;
                          work.text = value;
                          work.selection = previousSelection;
//
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Valid ID Presented', //--------Valid ID Presented----------------------//
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 80,
                      margin: EdgeInsets.only(right: 40),
                      child: DropdownButtonFormField(
                        hint: Text(
                          'Select ID Presented',
                          style: TextStyle(fontSize: 15),
                        ), // Not necessary for Option 1
                        value: selectid.text.isEmpty ? null : selectid.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectid.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ID Required';
                          } else {
                            return null;
                          }
                        },
                        // items: applicationtype.map((id) {
                        items: id.map((id) {
                          return DropdownMenuItem(
                            child: Text(id),
                            value: id,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Email',
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
                          else if (value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.') ||
                              !value.contains('.com')) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              email.selection; //----------new
                          email.text = value;
                          email.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey))),
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
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
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
                                    onPressed: () {
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
                      // _createUser(
                      //     selectapptype.text,
                      //     surname.text,
                      //     firstname.text,
                      // middle.text,
                      // address.text,
                      // yearsodresidence.text,
                      // birthplace.text,
                      // dateofbirth.text,
                      // selectsex.text,
                      // nationality.text,
                      // age.text,
                      // brgy.text,
                      // zone.text,
                      // selectdistrict.text,
                      // selectid.text,
                      // status.text,
                      // phonenum.text
                      // pension.text
                      // salary.text
                      // work.text
                      // id.text
                      // email.text,
                      //     );
                      _insertData(
                          selectapptype.text,
                          surname.text,
                          firstname.text,
                          middle.text,
                          address.text,
                          yearsodresidence.text,
                          birthplace.text,
                          dateofbirth.text,
                          selectsex.text,
                          nationality.text,
                          age.text,
                          brgy.text,
                          zone.text,
                          selectdistrict.text,
                          selectid.text,
                          status.text,
                          phonenum.text,
                          pension.text,
                          salary.text,
                          work.text,
                          email.text);
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

  Future<void> _insertData(
      String selectapptype,
      String surname,
      String firstname,
      String middle,
      String address,
      String yearsofresidence,
      String birthplace,
      String dateofbirth,
      String selectsex,
      String nationality,
      String age,
      String brgy,
      String zone,
      String selectdistrict,
      String selectid,
      String status,
      String phonenum,
      String pension,
      String salary,
      String work,
      String email) async {
    final data = MongoDbModel(
        selectapptype: selectapptype,
        surname: surname,
        firstname: firstname,
        middle: middle,
        address: address,
        yearsofresidence: yearsofresidence,
        birthplace: birthplace,
        dateofbirth: dateofbirth,
        selectsex: selectsex,
        nationality: nationality,
        age: age,
        brgy: brgy,
        zone: zone,
        selectdistrict: selectdistrict,
        selectid: selectid,
        status: status,
        phonenum: phonenum,
        pension: pension,
        salary: salary,
        work: work,
        email: email);

    var result = await MongoDatabase.insert(data);



  }
}

