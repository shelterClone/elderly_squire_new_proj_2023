import 'dart:math';


import 'package:elderly_squire_2023_remastered_v2/Benefits(Admin)/benefit_var.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits(Admin)/benefitsdb_services.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/AdminHomepage.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/database_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Benefits(Admin)/loading.dart';

class BenefitsUserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error.toString()}')),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Benefits(),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.teal,
          ),
        );
      },
    );
  }
}

class Benefits extends StatefulWidget {
  @override
  BenefitsState createState() =>  BenefitsState();
}

class  BenefitsState extends State<Benefits> {
  TextEditingController benefitsTitleController = TextEditingController();
  TextEditingController benefitsDescController = TextEditingController();

  @override


  void showEditDialog(BenefitsVarModel benefits) {
    benefitsTitleController.text = benefits.title;
    benefitsDescController.text = benefits.desc;
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        // backgroundColor: Colors.grey[800],
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Text(
              "Edit Benefits",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.white,
                color: Colors.grey[800],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.grey,
                size: 30,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        children: [
          Divider(),
          TextFormField(
            controller: benefitsTitleController,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              // color: Colors.white,
              color: Colors.grey[800],
            ),
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Title",
              // hintText: "eg. exercise",
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
          ),
          TextFormField(
            controller: benefitsDescController,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              // color: Colors.white,
              color: Colors.grey[800],
            ),
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                primary: Colors.blueGrey,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Save"),
              onPressed: () async {
                Navigator.pop(context);
                if (benefitsTitleController.text.isNotEmpty && benefitsDescController.text.isNotEmpty) {
                  await BenefitsDatabaseService().updateBenefits(
                    benefits.uid,
                    {'title': benefitsTitleController.text.trim(),
                      'description': benefitsDescController.text.trim()

                    },
                  );

                }
              },
            ),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    void dispose() {
      benefitsTitleController.dispose();
      benefitsDescController.dispose();
      super.dispose();
    }

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        backgroundColor: Colors.blueGrey[900],
        // backgroundColor: Colors.purple[500],
        title: Image.asset('assets/images/scardbene.png', height: 40, width: 125),
      ),
      body: Center(
        child: StreamBuilder<List<BenefitsVarModel>?>(
          stream: BenefitsDatabaseService().listBenefits(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            List<BenefitsVarModel>? benefits = snapshot.data!.cast<BenefitsVarModel>();
            return Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Benefits",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 10),
                  // Divider(color: Colors.grey[500]),
                  SizedBox(height: 20),
                  Expanded(
                    child:
                    ListView.builder(
                      itemCount: benefits!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          // height:120,
                          height:180,
                          child: Card(
                            // color: Colors.grey[100],
                            // color: Colors.purple[500],

                            elevation: 2,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                    onTap: () {
                                      BenefitsDatabaseService().updateBenefits(
                                        benefits[index].uid,
                                        {'completed': benefits[index]},
                                      );
                                    },
                                    title: Container(
                                      margin:EdgeInsets.only(top:50),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        benefits[index].title,
                                        style: TextStyle(
                                            fontSize: 25,
                                            // color: Colors.white,
                                            color: Colors.grey[700],
                                            // fontWeight: FontWeight.w600,
                                            fontFamily: 'BebasNeue'
                                        ),
                                      ),
                                    ),
                                    trailing: Image.asset('assets/images/benefits.png',height:30,width:30)
                                ),
                                Container(
                                  margin:EdgeInsets.only(left:18,right:18),
                                  alignment: Alignment.topLeft,
                                  child: Text(//-----------------------------------------------Desc--------------------//
                                    overflow: TextOverflow.ellipsis,
                                    benefits[index].desc,
                                    style: TextStyle(
                                        fontSize: 15,
                                        // color: Colors.white,
                                        color: Colors.grey[700],
                                        // fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                      },
                    ),
                  ),


                ],
              ),
            );
          },
        ),
      ),

    );
  }
}


