import 'package:flutter/material.dart';


class SelectGender extends StatefulWidget {
  @override
  SelectGenderState createState() => SelectGenderState();
}

class SelectGenderState extends State<SelectGender> {
//  List<String> _locations = ['Please choose a location', 'A', 'B', 'C', 'D']; // Option 1
//  String _selectedLocation = 'Please choose a location'; // Option 1
  List<String> gender = ['Male', 'Female', 'Other']; // Option 2
  String? selectgender; // Option 2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownButton(
            hint: Text('Select Gender'), // Not necessary for Option 1
            value: selectgender,
            onChanged: (newValue) {
              setState(() {
                selectgender = newValue as String?;
              });
            },
            items: gender.map((gender) {
              return DropdownMenuItem(
                child: new Text(gender),
                value: gender,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}



