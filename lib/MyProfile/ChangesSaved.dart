import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/MyProfile/UserProfile.dart';
import'package:flutter/material.dart';

class ChangesSaved extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          child:Center(
            child: Column(
              children: [
                SizedBox(height:200),
                Container(
                  height: 110,
                  width: 110,
                  child: Image.asset(
                      "assets/images/check_icon.png"),
                ),
                SizedBox(height:40),
                Container(
                  child: Text(
                    "Success!",
                    style: const TextStyle(
                      fontSize: 28,
                      // color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                    height:16
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10, right:10),
                  child: Text(
                    'Changes has been successfully saved.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                    ),
                  ),
                ),

                Container(
                  // margin: EdgeInsets.only(top:280),
                  margin: EdgeInsets.only(top:260),
                  height: 50,
                  width: 250,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Close",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: ('OpenSans'),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));

                    },

                  ),
                ),
              ],




            ),
          )
      ),
    );
  }
}
