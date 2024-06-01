import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/News/NewsHome.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage2 extends StatefulWidget {

  @override
  LoginState2 createState() => LoginState2();
}

  class LoginState2 extends State<LoginPage2>{

    FirebaseAuth _auth = FirebaseAuth.instance;
    // TextEditingController myEmail = TextEditingController() ;
    TextEditingController myUsername = TextEditingController() ;
    TextEditingController password = TextEditingController();
    bool isPasswordHidden = true;
    // String emailError = '';
    String usernameError = '';
    String passwordError = '';

    final GlobalKey <FormState> formkey = GlobalKey<FormState>();

    Future<void> _UserLogin(String myEmail, String password) async {
      if (validate()) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
           .signInWithEmailAndPassword(email: myEmail, password: password);
          print("User: $userCredential");

          await Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()
          ),
          );
        } on FirebaseAuthException catch (e)
        {
          // if (e.code == 'user-not-found') {
          //   setState(() {
          //     emailError = 'Email address does not exist.';
          //     passwordError = '';
          //   });
          // }
          if (e.code == 'user-not-found') {
            setState(() {
              usernameError = 'Username does not exist.';
              passwordError = '';
            });
          }
          else if (e.code == 'wrong-password') {
            setState(() {
              passwordError = 'Incorrect Password.';
              usernameError = '';
            });
          }
        }
        catch (e) {
          setState(() {
            usernameError = '';
            passwordError = 'An error occurred: $e';
          });
        }
      }
    }

    bool validate(){
      final form = formkey.currentState;
      form!.save();
      if(form.validate()){
        form.save();
        return true;
      }
      else{
        return false;
      }

    }




  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(
                  builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height + 100,
          width: double.infinity,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        margin:EdgeInsets.only(bottom:10),
                        child: Image.asset(
                            'assets/images/nursing.jpg',
                            height:200,
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Login",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin:EdgeInsets.only(bottom:10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Login to your Elderly Squire account",
                          style: TextStyle(
                              fontSize: 15,
                              color:Colors.grey[700]),),
                      ),
                    )

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // inputFile(label: "Email"),
                    // inputFile(label: "Password", obscureText: true),



                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color:Colors.black87
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 20),
                    //   child: TextFormField( //----------------------Email txtField-----------------------------//
                    //     enableSuggestions: true,
                    //     keyboardType: TextInputType.emailAddress,
                    //
                    //     obscureText: false,
                    //     validator: EmailValidator.validate,
                    //     // onSaved: (input)=> myEmail.text = input!,
                    //     onChanged: (value){
                    //       TextSelection previousSelection = myEmail.selection;
                    //       myEmail.text = value;
                    //       myEmail.selection = previousSelection;
                    //     },
                    //
                    //     decoration: InputDecoration(
                    //         errorText: emailError.isNotEmpty ? emailError : null,
                    //         contentPadding: EdgeInsets.symmetric(
                    //             vertical: 0,
                    //             horizontal: 10),
                    //
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: Colors.blueGrey
                    //           ),
                    //
                    //         ),
                    //         border: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Colors.blueGrey)
                    //         )
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField( //--------------Username txtField-----------------------------//
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,

                        obscureText: false,
                        validator: EmailValidator.validate,
                        // onSaved: (input)=> myEmail.text = input!,
                        onChanged: (value){
                          TextSelection previousSelection = myUsername.selection;
                          myUsername.text = value;
                          myUsername.selection = previousSelection;
                        },

                        decoration: InputDecoration(
                            errorText: usernameError.isNotEmpty ? usernameError : null,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey
                              ),

                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)
                            )
                        ),
                      ),
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color:Colors.black87
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField( //----------------------Password txtField-----------------------------//
                        obscureText: isPasswordHidden,
                        validator:PasswordValidator.validate,

                        // onSaved: (input)=> password.text = input!,
                        onChanged: (value){
                          TextSelection previousSelection = password.selection;
                          password.text = value;
                          password.selection = previousSelection;

                        },

                        decoration: InputDecoration(
                            errorText: passwordError.isNotEmpty ? passwordError : null,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10),
                            suffixIcon: IconButton(
                              icon:Icon(isPasswordHidden? Icons.visibility_off : Icons.visibility,color: Colors.grey),
                              onPressed: (){
                                setState(() {
                                  isPasswordHidden =! isPasswordHidden;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                  color: Colors.blueGrey
                              ),

                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)
                            )
                        ),
                      ),
                    ),


                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom:200),
                  height: 60,
                  width: 330,
//              margin: EdgeInsets.only(bottom:200),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Ok",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('OpenSans'),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    onPressed: (){
                         _UserLogin(myUsername.text, password.text);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));

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
}



class EmailValidator {
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialReg = RegExp(r".*[!@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?].*");


  static String? validate(String? value) {

    if (value == null || value.isEmpty) {
      return "Email Required";
    }

    // else if (value.isEmpty || !value.contains('@gmail')) {
    //   return "Please Enter a valid email address";
    // }
    else if (value.isEmpty || !value.contains('@') || !value.contains('.') || !value.contains('.com')){
      return "Please Enter a valid email address";
    }




    else {
      return null;
    }
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Password Required";
    }
    else if (value.isEmpty || value.length <8) {
      return "Password must be 8-16 characters";
    }
    else if (value.length > 16) {
      return "Password must be 8-16 characters";
    }

    else {
      return null;
    }
  }
}

