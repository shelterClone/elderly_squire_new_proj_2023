import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits(Admin)/benefit_var.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/todovar.dart';
import 'package:flutter/cupertino.dart';

typedef DocumentUID = String;
typedef FirestoreQuerySnapshot = QuerySnapshot<Map<String, dynamic>>;

class BenefitsDatabaseService {
  final CollectionReference<Map<String, dynamic>> benefits =
  FirebaseFirestore.instance.collection("SeniorBenefits");

  Future<void> addBenefits(String title, String description) async {
    try {
      await benefits.add({
        "title": title,
        // "isComplet": false,
        "description": description,
      });
    } catch (e) {
      print('Failed to create new todo: $e');
    }
  }

  // Future<void> completeTask(DocumentUID uid) async {
  //   try {
  //     await benefits.doc(uid).update({"isComplet": true});
  //   } catch (e) {
  //     print('Failed to complete task: $e');
  //   }
  // }

  Future<void> removeBenefits(DocumentUID uid) async {
    try {
      await benefits.doc(uid).delete();
    } catch (e) {
      print('Failed to remove todo: $e');
    }
  }

  Future<void> updateBenefits(DocumentUID uid, Map<String, dynamic> data) async {
    try {
      await benefits.doc(uid).update(data);
    } catch (e) {
      print('Failed to update todo: $e');
    }
  }

  List<BenefitsVarModel> benefitsFromFirestore(FirestoreQuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BenefitsVarModel(
        // isComplet: doc.data()["isComplet"] as bool,
        title: doc.data()["title"] as String,
        desc: doc.data()["description"] as String,
        uid: doc.id,
      );
    }).toList();
  }

  Stream<List<BenefitsVarModel>> listBenefits() {
    return benefits.snapshots().map(benefitsFromFirestore);
  }
}
