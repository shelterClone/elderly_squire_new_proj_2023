import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'MongoDbModel.dart';

class MongoDatabase {
  static var db, eldersregistrations;

  static connect() async {
    db = await Db.create(
        "mongodb+srv://databasesean:Masterabed1@cluster0.uimbcsn.mongodb.net/?retryWrites=true&w=majority"
    );
    //mongodb+srv://capstoneosca:osca12345@capstoneosca.bi2nv0c.mongodb.net/
    await db.open();
    inspect(db);
    eldersregistrations = db.collection("registrationform");
    //eldersregistrations
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await eldersregistrations.insertOne(data.toJson());
      if (result.isSuccess) {
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