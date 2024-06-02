import 'dart:math';

import 'package:elderly_squire_2023_remastered_v2/Announcements(Admin)/announcements_var.dart';
import 'package:elderly_squire_2023_remastered_v2/Announcements(Admin)/announcementsdb_services.dart';
import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/AdminHomepage.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/database_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loading.dart';

class AnnouncementsAdminPage extends StatelessWidget {
  
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
          home: Announcements(),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.teal,
          ),
        );
      },
    );
  }
}

class Announcements extends StatefulWidget {
  @override
  AnnouncementsState createState() =>  AnnouncementsState();
}

class  AnnouncementsState extends State<Announcements> {
  TextEditingController announcementsTitleController = TextEditingController();
  TextEditingController announcementsDescController = TextEditingController();

  @override

  void dispose() {
    announcementsTitleController.dispose();
    announcementsDescController.dispose();
    super.dispose();
  }



  void showEditDialog(AnnouncementsVarModel announcements) {
    announcementsTitleController.text = announcements.title;
    announcementsDescController.text = announcements.desc;
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
              "Edit Announcements",
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
            controller: announcementsTitleController,
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
            controller: announcementsDescController,
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
                if (announcementsTitleController.text.isNotEmpty && announcementsDescController.text.isNotEmpty) {
                  await AnnouncementsDatabaseService().updateAnnouncements(
                    announcements.uid,
                    {'title': announcementsTitleController.text.trim(),
                      'description': announcementsDescController.text.trim()

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


    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdminHomepage()));
          },
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        // backgroundColor: Colors.blueGrey[900],
        backgroundColor: Colors.purple[500],
        title: Image.asset('assets/images/megaphone.png', height: 40, width: 125),
      ),
      body: Center(
        child: StreamBuilder<List<AnnouncementsVarModel>?>(
          stream: AnnouncementsDatabaseService().listAnnouncements(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            }
            List<AnnouncementsVarModel>? announcements = snapshot.data!.cast<AnnouncementsVarModel>();
            return Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Announcements (Administrator)",
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
                      itemCount: announcements!.length,
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
                                    AnnouncementsDatabaseService().updateAnnouncements(
                                      announcements[index].uid,
                                      {'completed': announcements[index]},
                                    );
                                  },
                                  title: Container(
                                    margin:EdgeInsets.only(top:50),
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      announcements[index].title,
                                      style: TextStyle(
                                          fontSize: 25,
                                          // color: Colors.white,
                                          color: Colors.grey[700],
                                          // fontWeight: FontWeight.w600,
                                          fontFamily: 'BebasNeue'
                                      ),
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                            Icons.edit,
                                            // color: Colors.blueGrey
                                            color: Colors.lightBlueAccent
                                        ),
                                        onPressed: () {
                                          showEditDialog(announcements[index]);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete, color: Colors.red),
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Confirmation'),
                                                content: Text(
                                                    'Are you sure you want to delete?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog.
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('Delete'),
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                      await AnnouncementsDatabaseService().removeAnnouncements(
                                                        announcements[index].uid,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          // await AnnouncementsDatabaseService().removeBenefits(
                                          //   announcements[index].uid,
                                          // );

                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:EdgeInsets.only(left:18,right:18),
                                  alignment: Alignment.topLeft,
                                  child: Text(//-----------------------------------------------Desc--------------------//
                                    overflow: TextOverflow.ellipsis,
                                    announcements[index].desc,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.purple[400],
        onPressed: () {
          announcementsTitleController.clear();
          announcementsDescController.clear();
          showDialog(
            builder: (context) => SimpleDialog(
              contentPadding: EdgeInsets.symmetric(
                // horizontal: 25,
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
                    "Add Announcements",
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
                  ),
                ],
              ),
              children: [
                // Divider(),
                TextFormField(
                  controller: announcementsTitleController,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    // color: Colors.white,
                    color: Colors.grey[800],
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                  ),
                ),
                // Divider(),
                TextFormField(
                  controller: announcementsDescController,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    // color: Colors.white,
                    color: Colors.grey[800],
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: width,
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
                    child: Text("Add"),
                    onPressed: () async {
                      Navigator.pop(context);
                      if (announcementsTitleController.text.isNotEmpty && announcementsDescController.text.isNotEmpty) {
                        await AnnouncementsDatabaseService()
                            .addAnnouncements(
                            announcementsTitleController.text.trim(),announcementsDescController.text.trim()
                        );
                        announcementsTitleController.clear();
                        announcementsDescController.clear();

                      }
                    },
                  ),
                ),
              ],
            ),
            context: context,
          );
        },
      ),
    );
  }
}


