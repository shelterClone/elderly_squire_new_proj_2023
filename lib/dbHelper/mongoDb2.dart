import 'dart:developer';
import 'package:elderly_squire_2023_remastered_v2/dbHelper/MongoDbModel2.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'MongoDbModel.dart';

class MongoDatabase2 {
  static var db, eldersregistrations;

  static connect() async {
    db = await Db.create(
        "mongodb+srv://databasesean:Masterabed1@cluster0.uimbcsn.mongodb.net/?retryWrites=true&w=majority"
      // "mongodb+srv://capstoneosca:osca12345@capstoneosca.bi2nv0c.mongodb.net/" ------from Jao yung legit daw
    );

    await db.open();
    inspect(db);
    eldersregistrations = db.collection("registrationform");
    //eldersregistrations
  }

  static Future<String> insert(MongoDbModel2 data) async {
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


// static Future<void> insert(Function ID_Reg_Success, Function ID_Reg_Error,
//     data) async {
//   try {
//     var result = await eldersregistrations.insertOne(data.toJson());
//     if (result.isSuccess) {
//       // return "Data Inserted";
//       ID_Reg_Success();
//     }
//     else {
//       ID_Reg_Error();
//     }
//   } catch (e) {
//     print(e.toString());
//     ID_Reg_Error("Error: $e");
//   }
// }
}