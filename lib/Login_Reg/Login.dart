//import 'package:elderly_squire_2023_remastered/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/ID_Registration/ID_Registration.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Register.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[

                      Container(
                        margin:EdgeInsets.only(bottom:10),
                          child: Image.asset(
                              'assets/images/elderly_home.png',
                            height:200
                          )
                      ),




                      Container(
                        margin: EdgeInsets.only(bottom: 8, left:35),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Login",
                            style: TextStyle(
                                fontSize: 30,  fontWeight: FontWeight.bold
                        ),
                          )
                          ),
                        ),

                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, left:35),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Login to your account",
                            style: TextStyle(
                                fontSize: 15,
                                color:Colors.grey[700]),),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        inputFile(
                            label: "Email"
                        ),
                        inputFile(
                            label: "Password",
                            obscureText: true
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                  EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      height: 60,
                      width: 330,
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.blueGrey,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Ok",
                            style: TextStyle(
                                fontSize: 18,

                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onPressed: (){
//                        _UserLogin(myEmail.text, password.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));


                        },



                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      TextButton(
                        child: Text('Sign Up',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,

                            )),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));


                        },
                      ),

                    ],
                  ),
//                TextButton(
//                  child: Text('ID Registration',
//                      style: TextStyle(
//                        fontStyle: FontStyle.normal,
//
//                      )),
//                  onPressed: (){
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ID_Reg()));
//
//
//                  },
//                ),


//                Container(
//                  padding: EdgeInsets.only(top: 100),
//                  height: 200,
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: AssetImage("assets/background.png"),
//                        fit: BoxFit.fitHeight
//                    ),
//
//                  ),
//                )

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
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
        margin: EdgeInsets.only(bottom: 8),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0,
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
      SizedBox(height: 10,)
    ],
  );
}
