// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:mongo_dart/mongo_dart.dart';
//
// class MongoDbModel2 {
//   // final DateTime date;
//  required this. selectapptype;
//  required this. surname;
//  required this. firstname;
//  required this. middle;
//  required this. suffix;
//  required this. address;
//  required this. yearsofresidence;
//  required this. birthplace;
//  required this. dateofbirth;
//  required this. selectsex;
//  required this. nationality;
//  required this. age;
//  required this. brgy;
//  required this. zone;
//  required this. selectdistrict;
//  required this. selectid;
//  required this. status;
//  required this. phonenum;
//  required this. pension;
//  required this. salary;
//  required this. work;
//  required this. id;
//  required this. email;
//
//   MongoDbModel2( {
//     // required this String.date,
//     required this.selectapptype,
//     required this.surname,
//     required this.firstname,
//     required this.middle,
//     required this.suffix,
//     required this.address,
//     required this.yearsofresidence,
//     required this.birthplace,
//     required this.dateofbirth,
//     required this.selectsex,
//     required this.nationality,
//     required this.age,
//     required this.brgy,
//     required this.zone,
//     required this.selectdistrict,
//     required this.selectid,
//     required this.status,
//     required this.phonenum,
//     required this.pension,
//     required this.salary,
//     required this.work,
//     required this.id,
//     required this.email,
//   });

 import 'dart:convert';
import 'dart:core';
 import 'package:mongo_dart/mongo_dart.dart';

 MongoDbModel2 mongoDbModelFromJson(String str) =>
     MongoDbModel2.fromJson(json.decode(str));

 String mongoDbModelToJson(MongoDbModel2 data) => json.encode(data.toJson());

 class MongoDbModel2 {
 MongoDbModel2({
 required this.id,
 required this.selectapptype,
 required this.surname,
 required this.firstname,
 required this.middle,
 required this.suffix,
 required this.address,
 required this.yearsofresidence,
 required this.birthplace,
 required this.dateofbirth,
 required this.selectsex,
 required this.nationality,
 required this.age,
 required this.brgy,
 required this.zone,
 required this.selectdistrict,
 required this.selectid,
 required this.status,
 required this.phonenum,
 required this.pension,
 required this.salary,
 required this.work,
 required this.email,
 });

 ObjectId? id;
 String? selectapptype;
 String? surname;
 String? firstname;
 String? middle;
 String? suffix;
 String? address;
 String? yearsofresidence;
 String? birthplace;
 String? dateofbirth;
 String? selectsex;
 String? nationality;
 String? age;
 String? brgy;
 String? zone;
 String? selectdistrict;
 String? selectid;
 String? status;
 String? phonenum;
 String? pension;
 String? salary;
 String? work;
 String? email;

 factory MongoDbModel2.fromJson(Map<String, dynamic> json) => MongoDbModel2(
 id: json["_id"],
 selectapptype: json["TypeofApplication"],
 surname: json["SurName"],
 firstname: json["FirstName"],
 middle: json["Middle"],
 suffix: json["Suffix"],
 address: json["Address"],
 yearsofresidence: json["YrsofResidenceInManila"],
 birthplace: json["BirthPlace"],
 dateofbirth: json["DateofBirth"],
 selectsex: json["Gender"],
 nationality: json["Nationality"],
 age: json["Age"],
 brgy: json["Barangay"],
 zone: json["Zone"],
 selectdistrict: json["District"],
 selectid: json["ValidIdPresented"],
 status: json["CivilStatus"],
 phonenum: json["CellPhoneNumber"],
 pension: json["Pension"],
 salary: json["Salary"],
 work: json["PresentWork"],
 email: json["Email"],
 );

 Map<String, dynamic> toJson() => {
 "_id": id,
 "TypeofApplication": selectapptype,
 "SurName": surname,
 "FirstName": firstname,
 "Middle": middle,
 "Suffix": suffix,
 "Address": address,
 "YrsofResidenceInManila": yearsofresidence,
 "BirthPlace": birthplace,
 "DateofBirth": dateofbirth,
 "Gender": selectsex,
 "Nationality": nationality,
 "Age": age,
 "Barangay": brgy,
 "Zone": zone,
 "District": selectdistrict,
 "ValidIdPresented": selectid,
 "CivilStatus": status,
 "CellPhoneNumber": phonenum,
 "Pension": pension,
 "Salary": salary,
 "PresentWork": work,
 "Email": email,
 };
 }