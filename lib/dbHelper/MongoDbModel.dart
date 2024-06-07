import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());


class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.selectapptype,
    required this.surname,
    required this.firstname,
    required this.middlename,
    required this.suffix,
    required this.address,
    required this.yearsofresidence,
    required this.birthplace,
    required this.DateOfBirth,
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
    // required this.url,
    // required this.public_id,
    required this.proofOfValidID,
  });

  ObjectId? id;
  DateTime createdAt;
  DateTime updatedAt;
  String? selectapptype;
  String? surname;
  String? firstname;
  String? middlename;
  String? suffix;
  String? address;
  String? yearsofresidence;
  String? birthplace;
  String? DateOfBirth;
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
  // String? url;
  // String? public_id;
  ProofOfValidID proofOfValidID;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      id: json["_id"],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      selectapptype: json["TypeofApplication"],
      surname: json["SurName"],
      firstname: json["FirstName"],
      middlename: json["MiddleName"],
      address: json["Address"],
      suffix: json["Suffix"],
      yearsofresidence: json["YrsofResidenceInManila"],
      birthplace: json["BirthPlace"],
      DateOfBirth: json["DateOfBirth"],
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
      // url: json["Url"],
      // public_id: json["public_id"],
      proofOfValidID: ProofOfValidID.fromJson(json['ProofOfValidID']));

  Map<String, dynamic> toJson() => {
    "_id": id,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    "TypeofApplication": selectapptype,
    "SurName": surname,
    "FirstName": firstname,
    "MiddleName": middlename,
    "Suffix": suffix,
    "Address": address,
    "YrsofResidenceInManila": yearsofresidence,
    "BirthPlace": birthplace,
    "DateOfBirth": DateOfBirth,
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
    // "Url": url,
    // "public_id": public_id,
    'ProofOfValidID': proofOfValidID.toJson(),
  };
}

class ProofOfValidID {
  String publicId;
  String url;

  ProofOfValidID({required this.publicId, required this.url});

  factory ProofOfValidID.fromJson(Map<String, dynamic> json) {
    return ProofOfValidID(
      publicId: json['public_id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'public_id': publicId,
    'url': url,
  };
}