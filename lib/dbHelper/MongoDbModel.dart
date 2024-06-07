import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());


class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.selectapptype,
    required this.surname,
    required this.firstname,
    required this.middlename,
    required this.suffix,
    required this.address,
    required this.yearsofresidence,
    required this.birthplace,
    required this.DateofBirth,
    required this.selectsex,
    required this.nationality,
    required this.age,
    required this.brgy,
    required this.zone,
    required this.selectdistrict,
    required this.selectcivilstatus,
    required this.selectstatus,
    required this.MobilePhone,
    required this.selectidpresented,
    required this.url,
    required this.public_id,
  });

  ObjectId? id;
  String? selectapptype;
  String? surname;
  String? firstname;
  String? middlename;
  String? suffix;
  String? address;
  String? yearsofresidence;
  String? birthplace;
  String? DateofBirth;
  String? selectsex;
  String? nationality;
  String? age;
  String? brgy;
  String? zone;
  String? selectdistrict;
  String? selectcivilstatus;
  String? selectstatus;
  String? MobilePhone;
  String? selectidpresented;
  String? url;
  String? public_id;


  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      id: json["_id"],
      selectapptype: json["TypeofApplication"],
      surname: json["SurName"],
      firstname: json["FirstName"],
      middlename: json["MiddleName"],
      address: json["Address"],
      suffix: json["Suffix"],
      yearsofresidence: json["YrsofResidenceInManila"],
      birthplace: json["BirthPlace"],
      DateofBirth: json["DateofBirth"],
      selectsex: json["Gender"],
      nationality: json["Nationality"],
      age: json["Age"],
      brgy: json["Barangay"],
      zone: json["Zone"],
      selectdistrict: json["District"],
      selectcivilstatus: json["CivilStatus"],
      selectstatus: json["Status"],
      MobilePhone: json["MobilePhone"],
      selectidpresented: json["ValidIdPresented"],
      url: json["Url"],
      public_id: json["public_id"]);

  Map<String, dynamic> toJson() => {
    "_id": id,
    "TypeofApplication": selectapptype,
    "SurName": surname,
    "FirstName": firstname,
    "MiddleName": middlename,
    "Suffix": suffix,
    "Address": address,
    "YrsofResidenceInManila": yearsofresidence,
    "BirthPlace": birthplace,
    "DateofBirth": DateofBirth,
    "Gender": selectsex,
    "Nationality": nationality,
    "Age": age,
    "Barangay": brgy,
    "Zone": zone,
    "District": selectdistrict,
    "CivilStatus": selectcivilstatus,
    "Status": selectstatus,
    "MobilePhone": MobilePhone,
    "ValidIdPresented": selectidpresented,
    "Url": url,
    "public_id": public_id,
  };
}