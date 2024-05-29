import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/Benefits(Admin)/benefit_var.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/todovar.dart';
import 'package:flutter/cupertino.dart';

import 'announcements_var.dart';

typedef DocumentUID = String;
typedef FirestoreQuerySnapshot = QuerySnapshot<Map<String, dynamic>>;

class AnnouncementsDatabaseService{
  final CollectionReference<Map<String, dynamic>> announcements =
  FirebaseFirestore.instance.collection("Announcements");

  Future<void> addAnnouncements(String title, String description) async {
    try {
      await announcements.add({
        "title": title,
        "description": description,

        // "isComplet": false,
      });
    } catch (e) {
      print('Failed to create new announcement: $e');
    }
  }


  Future<void> removeAnnouncements(DocumentUID uid) async {
    try {
      await announcements.doc(uid).delete();
    } catch (e) {
      print('Failed to remove todo: $e');
    }
  }

  Future<void> updateAnnouncements(DocumentUID uid, Map<String, dynamic> data) async {
    try {
      await announcements.doc(uid).update(data);
    } catch (e) {
      print('Failed to update todo: $e');
    }
  }

  List<AnnouncementsVarModel> AnnouncementsFromFirestore(FirestoreQuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AnnouncementsVarModel(
        // isComplet: doc.data()["isComplet"] as bool,
        title: doc.data()["title"] as String,
        desc: doc.data()["description"] as String,
        uid: doc.id,
      );
    }).toList();
  }

  Stream<List<AnnouncementsVarModel>> listAnnouncements() {
    return announcements.snapshots().map(AnnouncementsFromFirestore);
  }
}
