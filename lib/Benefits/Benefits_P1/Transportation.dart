import 'package:flutter/material.dart';

void TranspoBenefits(BuildContext context) {//--------------------TransportationBene
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text('Privacy Policy')),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
//            height: 2310,
//                 height: 33700,
                width: 8000,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                          child: Text(
                            'Republic of the Philippines',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Congress of the Philippines',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Metro Manila',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Fifteenth Congress',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Center(
                      child: Container(
                          margin:
                          EdgeInsets.only(left: 10, bottom: 20, right: 10),
                          child: Text(
                            'Second Regular Session',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: ('OpenSans'),
                                fontWeight: FontWeight.bold),
                          )),
                    ),

                    Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 10, bottom: 20, right: 10),
                        child: Text(
                          'Begun and held in Metro Manila, on Monday, the twenty-fifth day of July, two thousand eleven.',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: ('OpenSans'),
                              fontWeight: FontWeight.normal),
                        )),

                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close',
              ),
            ),
          ),
        ],
      );
    },
  );
}