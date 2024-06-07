import 'dart:convert';
import 'dart:io';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/ID_Registration/IDReg_Success_Screen.dart';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/MongoDbModel.dart';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/MongoDbModel2.dart';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/mongoDb.dart';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/mongoDb2.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Login_Reg/RegSuccess.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // final cloudinary = CloudinaryPublic('dqs4lb8kt', 'cuuz8bg0', cache: false);
  final cloudinary = CloudinaryPublic('dtdtiuwxl', 'azfvz29n', cache: false);
  File? pdffile;
  String? url;
  String? public_id;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");
  RegExp mobilenumReg = RegExp(r'^9[0-9]{9}$');

  List<String> applicationtype = [
    'Voter',
    'Non-Voter',
  ];

  late TextEditingController selectapptype;

  TextEditingController surname = TextEditingController();

  TextEditingController firstname = TextEditingController();

  TextEditingController middlename = TextEditingController();

  TextEditingController suffix = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController yearsofdresidence = TextEditingController();

  TextEditingController birthplace = TextEditingController();

  TextEditingController DateofBirth = TextEditingController();

  List<String> sex = ['Male', 'Female'];
  late TextEditingController selectsex;

  TextEditingController nationality = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController brgy = TextEditingController();

  TextEditingController zone = TextEditingController();

  List<String> district = ['1', '2', '3', '4', '5', '6'];
  late TextEditingController selectdistrict;

  List<String> civilstatus = [
    'Single',
    'Married',
    'Widowed',
    'Legal Separated',
  ];

  late TextEditingController selectcivilstatus;

  List<String> status = [
    'Active',
    'Bedridden',
    'Physical Incapacity',
    'Mental Incapacity',
  ];

  late TextEditingController selectstatus;

  TextEditingController MobilePhone = TextEditingController();

  List<String> id = [
    'Passport ID',
    'Voter\'s ID',
    'SSS ID',
    'Umid ID',
    'Police Clearance',
    'NBI Clearance',
    'National ID',
    'Birth Certificate',
    'Barangay Certificate',
  ];
  late TextEditingController selectidpresented;

  TextEditingController idproof = TextEditingController();

  Future<void> selectPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        setState(() {
          pdffile = File(result.files.single.path!);
          _uploadPDF();
        });
      }
    } catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  Future<void> _uploadPDF() async {
    if (pdffile != null) {
      try {
        String fileName = pdffile!.path.split('/').last;
        public_id = fileName.split('.').first;
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(pdffile!.path,
              resourceType: CloudinaryResourceType.Image,
              folder: 'pdf_files',
              publicId: public_id),
        );
        setState(() {
          url = response.secureUrl;
          public_id = response.publicId;
        });
        // print("Upload Successful:");
        print("Upload Successful Url: ${response.secureUrl}");
        print("Upload Successful Public ID: ${response.publicId}");
      } catch (e) {
        // Handle upload failure
        print("Upload Failed: $e");
      }
    } else {
      // Handle no file selected
      print("No PDF file selected");
    }
  }

  bool ischecked = false;

  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    selectapptype = TextEditingController();
    surname.text = '';
    firstname.text = '';
    middlename.text = '';
    suffix.text = '';
    address.text = '';
    yearsofdresidence.text = '';
    birthplace.text = '';
    // DateofBirth.toIso8601String();
    DateofBirth.text = '';
    selectsex = TextEditingController();
    nationality.text = '';
    age.text = '';
    brgy.text = '';
    zone.text = '';
    selectdistrict = TextEditingController();
    selectcivilstatus = TextEditingController();
    selectstatus = TextEditingController();
    MobilePhone.text = '';
    selectidpresented = TextEditingController();
    idproof.text = '';
    url = '';
    public_id = '';

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

  Widget build(BuildContext context) {
    void dispose() {
      selectapptype.text = '';
      surname.text = '';
      firstname.text = '';
      middlename.text = '';
      suffix.text = '';
      address.text = '';
      yearsofdresidence.text = '';
      birthplace.text = '';
      // DateofBirth.toIso8601String();
      DateofBirth.text = '';
      selectsex.text = '';
      nationality.text = '';
      age.text = '';
      brgy.text = '';
      zone.text = '';
      selectdistrict.text = '';
      selectcivilstatus.text = '';
      selectstatus.text = '';
      MobilePhone.text = '';
      selectidpresented.text = '';
      super.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height + 2350,
          // .height + 2550,
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
                      'Type of Application',
                      //------------------Type of Application-----------------------//
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
                        ),
                        // Not necessary for Option 1
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
                          } else {
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
                          hintText: 'ex: Dela Cruz',
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
                          } else {
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
                            hintText: 'ex: Juan',
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
                        controller: middlename,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Middle Name Required";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              middlename.selection; //----------new
                          middlename.text = value;
                          middlename.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            hintText: 'ex: Juarez',
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
                      'Suffix (Optional)',
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
                        controller: suffix,
                        onChanged: (value) {
                          TextSelection previousSelection =
                              suffix.selection; //----------new
                          suffix.text = value;
                          suffix.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            hintText: 'ex: Jr or Sr',
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
                          } else {
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
                        controller: yearsofdresidence,
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
                              yearsofdresidence.selection; //----------new
                          yearsofdresidence.text = value;
                          yearsofdresidence.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            hintText: 'ex: 70',
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
                            return "Birthplace Required";
                          } else {
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
                            hintText: 'ex: Manila City',
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
                        controller: DateofBirth,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Date of Birth Required";
                          } else {
                            return null;
                          }
                        },

                        onChanged: (value) {
                          TextSelection previousSelection =
                              DateofBirth.selection; //----------new
                          DateofBirth.text = value;
                          DateofBirth.selection =
                              previousSelection; //--------------new
                        },

                        decoration: InputDecoration(
                            hintText: 'ex: 08/25/1950',
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
                          'ex: Male or Female',
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
                            hintText: 'ex: Filipino',
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
                            hintText: 'ex: 60',
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
                            hintText: 'ex: 115',
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
                            hintText: 'ex: 10',
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
                      'Civil Status', //------------------------Civil Status------------//
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
                          'Select Civil Status',
                          style: TextStyle(fontSize: 15),
                        ),
                        value: selectcivilstatus.text.isEmpty
                            ? null
                            : selectcivilstatus.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectcivilstatus.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Civil Status required';
                          } else {
                            return null;
                          }
                        },
                        items: civilstatus.map((dist) {
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
                      'Status',
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
                          'Select Status',
                          style: TextStyle(fontSize: 15),
                        ),
                        value: selectstatus.text.isEmpty
                            ? null
                            : selectstatus.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectstatus.text = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Status required';
                          } else {
                            return null;
                          }
                        },
                        items: status.map((dist) {
                          return DropdownMenuItem(
                            child: Text(dist),
                            value: dist,
                          );
                        }).toList(),
                      ),
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
                        maxLength: 10,

                        //----------------------Phone Number----------------------------//
                        keyboardType: TextInputType.number,
                        controller: MobilePhone,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone Number Required";
                          }
                          if (value.length > 10 || value.length < 10) {
                            return "Invalid Phone Number";
                            // input placeholder format
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          TextSelection previousSelection =
                              MobilePhone.selection;
                          MobilePhone.text = value;
                          MobilePhone.selection = previousSelection;
//
                        },

                        decoration: InputDecoration(
                            hintText: 'ex: 9915270166',
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
                      'Proof of Valid ID Presented(Scanned/PDF)',
                      //--------Valid ID Presented----------------------//
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
                        ),
                        // Not necessary for Option 1
                        value: selectidpresented.text.isEmpty
                            ? null
                            : selectidpresented.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectidpresented.text = newValue!;
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
                    pdffile == null
                        ? Text('No PDF Selected')
                        : Text('PDF Uploaded'),
                    // : Text('Selected PDF: ${pdffile!.path}'),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: ElevatedButton(
                        //-------------------------------PDF Uploader--------------//
                        onPressed: selectPDF,
                        child: Text('Select PDF'),

                      ),
                    ),
                  ],
                ),
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
                                    onPressed: () {},
                                    child: Text('Privacy Policy',
                                        style: TextStyle()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          state.errorText ?? '',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
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
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      elevation: 2,
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
                      _insertData(
                        selectapptype.text,
                        surname.text,
                        firstname.text,
                        middlename.text,
                        suffix.text,
                        address.text,
                        yearsofdresidence.text,
                        birthplace.text,
                        // DateofBirth.toIso8601String(),
                        DateofBirth.text,
                        selectsex.text,
                        nationality.text,
                        age.text,
                        brgy.text,
                        zone.text,
                        selectdistrict.text,
                        selectcivilstatus.text,
                        selectstatus.text,
                        MobilePhone.text,
                        selectidpresented.text,
                        public_id!,
                        url!,
                      );
                      print('selectAppType: $selectapptype');
                      print('surname: $surname');
                      print('firstName: $firstname');
                      print('middleName: $middlename');
                      print('suffix: $suffix');
                      print('address: $address');
                      print('yearsOfResidence: $yearsofdresidence');
                      print('birthplace: $birthplace');
                      print('dateOfBirth: $DateofBirth');
                      print('selectSex: $selectsex');
                      print('nationality: $nationality');
                      print('age: $age');
                      print('brgy: $brgy');
                      print('zone: $zone');
                      print('selectDistrict: $selectdistrict');
                      print('selectCivilStatus: $selectcivilstatus');
                      print('selectStatus: $selectstatus');
                      print('mobilePhone: $MobilePhone');
                      print('selectIdPresented: $selectidpresented');
                      print('publicId: $public_id');
                      print('url: $url');
                      setState(() {
                        selectapptype = new TextEditingController();
                        surname = new TextEditingController();
                        firstname = new TextEditingController();
                        middlename = new TextEditingController();
                        suffix = new TextEditingController();
                        address = new TextEditingController();
                        yearsofdresidence = new TextEditingController();
                        birthplace = new TextEditingController();
                        // DateofBirth.toIso8601String(),
                        DateofBirth = new TextEditingController();
                        selectsex = new TextEditingController();
                        nationality = new TextEditingController();
                        age = new TextEditingController();
                        brgy = new TextEditingController();
                        zone = new TextEditingController();
                        selectdistrict = new TextEditingController();
                        selectcivilstatus = new TextEditingController();
                        selectstatus = new TextEditingController();
                        MobilePhone = new TextEditingController();
                        selectidpresented = new TextEditingController();
                        public_id = '';
                        url = '';
                      });

                    },
                  ),
                ),
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
      String middlename,
      String suffix,
      String address,
      String yearsofresidence,
      String birthplace,
      String DateofBirth,
      String selectsex,
      String nationality,
      String age,
      String brgy,
      String zone,
      String selectdistrict,
      String selectcivilstatus,
      String selectstatus,
      String MobilePhone,
      String selectidpresented,
      String public_id,
      String url,
      ) async {
    if (validateReg()) {
      try {
        final data = MongoDbModel(
          id: null,
          selectapptype: selectapptype,
          surname: surname,
          firstname: firstname,
          middlename: middlename,
          suffix: suffix,
          address: address,
          yearsofresidence: yearsofresidence,
          birthplace: birthplace,
          DateofBirth: DateofBirth,
          selectsex: selectsex,
          nationality: nationality,
          age: age,
          brgy: brgy,
          zone: zone,
          selectdistrict: selectdistrict,
          selectcivilstatus: selectcivilstatus,
          selectstatus: selectstatus,
          MobilePhone: MobilePhone,
          selectidpresented: selectidpresented,
          public_id: public_id,
          url: url,
        );

        var result = await MongoDatabase.insert(data);
        // Navigator.push(result as BuildContext, MaterialPageRoute(builder: (context)=> RegSuccess()));
      } catch (e) {
        print("Error: $e");
      }
    }
  }
}
