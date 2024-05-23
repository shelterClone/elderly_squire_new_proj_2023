import 'dart:developer';
import 'package:elderly_squire_2023_remastered_v2/ID_Registration/IDReg_Success_Screen.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'MongoDbModel.dart';

class MongoDatabase {
  static var db, eldersRegistrations;

  static connect() async {
    db = await Db.create(
        "mongodb+srv://databasesean:Masterabed1@cluster0.uimbcsn.mongodb.net/?retryWrites=true&w=majority");
    // "mongodb+srv://capstoneosca:osca12345@capstoneosca.bi2nv0c.mongodb.net/");
    await db.open();
    inspect(db);
    eldersRegistrations = db.collection("registrationform");
    //registrationform
    //eldersregistrations

  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await eldersRegistrations.insert(data.toJson());
      if (result) {
        return "Data Inserted";
      } else {
        return "Something Wrong with data";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
