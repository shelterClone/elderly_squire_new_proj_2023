import 'package:flutter/material.dart';
import 'HomePage.dart';


class AboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{ //app routes
        '/emailadd': (BuildContext context) => Homepage(),
      },
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body:
        SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top:3),
              child: Column(
                children:<Widget>[
                  Image.asset('assets/images/elderly_squire_logo_classic.png',height: 200,width: 200),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left:50,right:10),
                                child: Divider(
                                  color: Colors.white,
                                ),
                              )
                          ),

                          Text("ABOUT US",style: TextStyle(
                              color: Colors.orangeAccent,
                              letterSpacing: 5
                          ),),

                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left:10,right:50),
                                child: Divider(
                                  color: Colors.white,
                                ),
                              )
                          ),
                        ]
                    ),
                  ),


                  Container(
                    // margin:EdgeInsets.only(top:20,left:25),
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin:EdgeInsets.only(top:10),
                          child: ListTile(
                            leading: Container(
                              margin:EdgeInsets.only(left:10),
                              height:100,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,),
                            ),
                            title: Text('Roi Kim Alfred A. Ruiz',
                                style:TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold
                                )),
                            subtitle:Text('App Developer',
                                style:TextStyle(
                                    color: Colors.grey
                                )),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:0.5),
                          child: ListTile(
                            leading: Container(
                              margin:EdgeInsets.only(left:10),
                              height:100,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,),
                            ),
                            title: Text('Angelo B. Del Rosario',
                                style:TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold
                                )),
                            subtitle:Text('System Analyst',
                                style:TextStyle(
                                    color: Colors.grey
                                )),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:0.5),
                          child: ListTile(
                            leading: Container(
                              margin:EdgeInsets.only(left:10),
                              height:100,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,),
                            ),
                            title: Text('Sean Michael M. Calabung',
                                style:TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold
                                )),
                            subtitle:Text('App Developer',
                                style:TextStyle(
                                    color: Colors.grey
                                )),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:0.5),
                          child: ListTile(
                            leading: Container(
                              margin:EdgeInsets.only(left:10),
                              height:100,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,),
                            ),
                            title: Text('Jao Renzo M. Padua',
                                style:TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold
                                )),
                            subtitle:Text('App Developer',
                                style:TextStyle(
                                    color: Colors.grey
                                )),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:0.5),
                          child: ListTile(
                            leading: Container(
                              margin:EdgeInsets.only(left:10),
                              height:100,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,),
                            ),
                            title: Text('Christopher M. Viñas',
                                style:TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold
                                )),
                            subtitle:Text('Technical Writer',
                                style:TextStyle(
                                    color: Colors.grey
                                )),
                          ),
                        ),
                      ],

                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:20),
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orangeAccent,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left:40,right:10),
                            child: Text('Back',
                              style: TextStyle(

                                color: Colors.white,
                                fontSize: 18,
                              ) ,),
                          )


                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homepage()),
                        );
                      },
                    ),
                  ),









                ],
              ),
            ),




          ),
        ),),
    );
  }
}
