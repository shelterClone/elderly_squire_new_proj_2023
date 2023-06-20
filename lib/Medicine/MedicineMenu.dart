//import 'package:elderly_squire_capstone/HomePage2.dart';
//import 'package:elderly_squire_capstone/todo_list.dart';
import 'package:elderly_squire_2023_remastered_v2/Homepage.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'Homeage.dart';
//import 'ReminderHome.dart';
//import 'ToDoList.dart';
//import 'todos.dart';

class MedicineMenu extends StatelessWidget {
//  final String email;
//  MedicineMenu({@required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
//        backgroundColor: Colors.blueGrey[900],
        backgroundColor: Colors.blueGrey,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
        title: Image.asset('assets/images/medicine.png',
            height: 40, width: 125),
      ),

      body: Column(
          children:<Widget>[
            GestureDetector(
              child: Container(
                height: 150,
                child: Card(
                  //------------------------------Medication Reminder---------------------------------//
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: InkWell(
                            onTap: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => ID_Reg()),
//                              );
                            },
                            child: Image.asset('assets/images/reminder.png',
                                height: 300, width: 70),
                          )),
                      Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 51, left: 25),
                              child: InkWell(
//                                onTap: () {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => ID_Reg()),
//                                  );
//                                },
                                child: Text(
                                  'Medication Reminder',
                                  style: TextStyle(
                                      fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                              )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              'Application for Senior Citizen ID',
//                              style: TextStyle(
//                                fontFamily: ('OpenSans'),
//                                fontSize: 14,
//
////                                  fontWeight: FontWeight.bold
//                              ),
//                            ))
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ),

            GestureDetector(
              child: Container(
                height: 150,
                child: Card(
                  //------------------------------To Do List Menu---------------------------------//
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 30),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MedicineMenu()),
                              );
                            },
                            child: Image.asset('assets/images/todolist.png',
                                height: 300, width: 70),
                          )),
                      Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 51, left: 25),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MedicineMenu()),
                                  );
                                },
                                child: Text(
                                  'To Do List',
                                  style: TextStyle(
                                      fontFamily: ('OpenSans'), fontSize: 21

//                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                              )),
//                        Container(
//                            margin: EdgeInsets.only(top: 5),
//                            child: Text(
//                              '(Description)',
//                              style: TextStyle(
//                                fontFamily: ('OpenSans'),
//                                fontSize: 14,
//
////                                  fontWeight: FontWeight.bold
//                              ),
//                            ))
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ),




          ]
      )
    );
  }
}
