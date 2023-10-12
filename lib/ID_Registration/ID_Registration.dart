import 'package:elderly_squire_2023_remastered_v2/Login_Reg/Uploader2.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/ImageUploader.dart';
import 'package:elderly_squire_2023_remastered_v2/Login_Reg/pdf_uploader_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import'package:intl/intl.dart';

class ID_Reg extends StatefulWidget {
  @override
  _ID_RegState createState() => _ID_RegState();
}


class _ID_RegState extends State< ID_Reg> {

  TextEditingController dateController=TextEditingController();
  TextEditingController dateofbirthController=TextEditingController();
  TextEditingController yearofresController=TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController surname = TextEditingController();
  





  String? applicationtype;
  String? IDtype;

  @override
  void initState(){
    super.initState();
    dateController.text="";
    dateofbirthController.text="";
    yearofresController.text="";


  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
          height: MediaQuery.of(context).size.height + 2190,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset('assets/images/health_consult.png',
                          height: 200)),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Application form for Senior Citizen ID",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,

                        ),)
                      ,
                    ),
                  ),
                  SizedBox(height: 5),
                 Container(
                   margin: EdgeInsets.only(bottom: 5),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text("ID registration for senior citizen's ID",
                       style: TextStyle(
                           fontSize: 15,
                           color:Colors.grey[700]),),
                   ),
                 )

                ],
              ),
              Column(
                children: <Widget>[



                  Container(//------------------------------------------------Radio Button
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                          margin: EdgeInsets.only(top:30,bottom: 20),
                          child: Text("Type of Application", style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color:Colors.black87
                          ),),
                        ),
                      RadioListTile(
                        title: Text("New Senior(Voter)"),
                        value: "new_voter",
                        groupValue: applicationtype,
                        onChanged: (value){
                          setState(() {
                            applicationtype = value.toString();
                          });
                        },
                      ),

                      RadioListTile(
                        title: Text("New Senior(Non-Voter)"),
                        value: "new_non_voter",
                        groupValue: applicationtype,
                        onChanged: (value){
                          setState(() {
                            applicationtype = value.toString();
                          });
                        },
                      ),

                      RadioListTile(
                        title: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text("Old Senior")),
                        value: "old_sen",
                        groupValue: applicationtype,
                        onChanged: (value){
                          setState(() {
                            applicationtype = value.toString();
                          });
                        },
                      ),
    ],),
    ),


                  inputFile(label: "Firstname"),
                  inputFile(label: "Surname"),
                  // inputFile(label: "Lastname"),
                  inputFile(label: "Address"),
                  // inputFile(label: "Years of Residence in Manila"),
                  inputFile(label: "Birthplace"),
                  Container(//-------------------------------------------Date of Birth----------------------------------//
                    margin:EdgeInsets.only(top:10,right:190, bottom: 10),
                    child: Text("Date of Birth",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color:Colors.black87
                      ),
                    ),


                  ),
                  Center(
                      child: Container(
                        margin:EdgeInsets.only( bottom: 20),
                        child: TextField(
                          controller: dateofbirthController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
//                                labelText: "Enter Date",
                            hintText: "Select Date",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color:Colors.grey
                            ),
                          ),
                          readOnly: true,
                          onTap:()async{
                            DateTime? pickedDate=await showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000,30),
                              lastDate: DateTime(2101),
                            );
                            if(pickedDate!=null){
                              String formattedDate=DateFormat("yyyy-MM-dd").format(pickedDate).toString();
                              setState(() {
                                dateofbirthController.text=formattedDate.toString();
                              });
                            }
                            else{
                              print("Not Selected");
                            }
                          },
                        ),
                      )),
                  inputFile(label: "Age"),
                  inputFile(label: "Nationality"),
                  Container(//-------------------------------------------Year of Residence in Manila----------------------------------//
                    margin:EdgeInsets.only(top:10,right:90, bottom: 10),
                    child: Text("Year of Residence in Manila",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color:Colors.black87
                      ),
                    ),


                  ),
                  Center(
                      child: Container(
                        margin:EdgeInsets.only( bottom: 20),
                        child: TextField(
                          controller: yearofresController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
//                                labelText: "Enter Date",
                            hintText: "Select Date",
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color:Colors.grey
                            ),
                          ),
                          readOnly: true,
                          onTap:()async{
                            DateTime? pickedDate=await showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000,30),
                              lastDate: DateTime(2101),
                            );
                            if(pickedDate!=null){
                              String formattedDate=DateFormat("yyyy-MM-dd").format(pickedDate).toString();
                              setState(() {
                                yearofresController.text=formattedDate.toString();
                              });
                            }
                            else{
                              print("Not Selected");
                            }
                          },
                        ),
                      )),
                  inputFile(label: "Brgy"),
                  inputFile(label: "Zone"),
                  inputFile(label: "District"),
                  inputFile(label: "Monthly Salary"),
                  inputFile(label: "Monthly Pension"),
                  inputFile(label: "Kasalukuyang Gawain/Present Work"),
                  SizedBox(height:10),
                  Container(
                    margin: EdgeInsets.only(bottom: 10,right:150),
                    child: Text("Valid ID Presented", style: TextStyle(//---------------------Valid ID presented----------------// L
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color:Colors.black87
                    ),),
                  ),
                  RadioListTile(//-------------------------passport-------//
                    title: Text("Passport"),
                    value: "pport",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  RadioListTile( //-------------------------voter's id-------//
                    title: Text("Voter's ID"),
                    value: "vid",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  RadioListTile( //-------------------------SSS ID-------//
                    title: Text("SSS ID"),
                    value: "sssid",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  RadioListTile(//-------------------------GSIS ID-------//
                    title: Text("GSIS ID"),
                    value: "gsisid",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  RadioListTile( //-------------------------police clearance-------//
                    title: Text("Police Clearance"),
                    value: "pclear",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  RadioListTile(//-------------------------nbi clearance-------//
                    title: Text("NBI Clearance"),
                    value: "nbiclear",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  RadioListTile(//-------------------------national ID-------//
                    title: Text("National ID"),
                    value: "nid",
                    groupValue: applicationtype,
                    onChanged: (value){
                      setState(() {
                        applicationtype = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 10),

                  inputFile(label: "Email"),
                  // Container(
                  //   margin: EdgeInsets.only(top:5,bottom: 20,right:177),
                  //   child: Text("Upload Recent Valid ID", style: TextStyle(//---------------------Valid ID presented----------------// L
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w400,
                  //       color:Colors.black87
                  //   ),),
                  // ),
                  // IDUploader(),

                ],
              ),
              // Container(
              //   margin: EdgeInsets.only(top:5,bottom: 20,right:190),
              //   child: Text("Upload 3 1x1 picture", style: TextStyle(//---------------------1x1 picture----------------// L
              //       fontSize: 15,
              //       fontWeight: FontWeight.w400,
              //       color:Colors.black87
              //   ),),
              // ),
              // Uploader2(),
//              Container(
//                margin: EdgeInsets.only(top:5,bottom: 20,right:190),
//                child: Text("Please Print and Notarized: ", style: TextStyle(//---------------------1x1 picture----------------// L
//                    fontSize: 15,
//                    fontWeight: FontWeight.w400,
//                    color:Colors.black87
//                ),),
//              ),
//              PdfUploaderScreen(),

              Container(
                height: 60,
                width: 330,
                margin: EdgeInsets.only(top:10,bottom:30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: Colors.blueGrey[800],
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

