import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:elderly_squire_2023_remastered_v2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height + 500,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      margin:EdgeInsets.only(bottom:10),
                      child: Image.asset(
                          'assets/images/volunteer.jpg',
                          height:200
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sign Up",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sign Up for your Elderly Squire account",
                        style: TextStyle(
                            fontSize: 15,
                            color:Colors.grey[700]),),
                    ),
                  )

                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Firstname"),
                  inputFile(label: "Middlename"),
                  inputFile(label: "Lastname"),
                  inputFile(label: "Address"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                  inputFile(label: "Confirm Password ", obscureText: true),
                ],
              ),
              Container(
                height: 60,
                width: 330,
                margin: EdgeInsets.only(top:10,bottom:130),
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
                  onPressed: (){
//                        _UserLogin(myEmail.text, password.text);

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
        margin: EdgeInsets.only(bottom: 20),
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
