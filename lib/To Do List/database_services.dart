import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/todovar.dart';
import 'package:flutter/cupertino.dart';



class DatabaseService {
  CollectionReference todosCollection =
  FirebaseFirestore.instance.collection("Todos");

  Future createNewTodo(String title) async {
    return await todosCollection.add({
      "title": title,
      "isComplet": false,
    });
  }




  Future completTask(uid) async {
    await todosCollection.doc(uid).update({"isComplet": true});
  }

  Future removeTodo(uid) async {
    await todosCollection.doc(uid).delete();
  }

  List<TodoVar>? todoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return TodoVar(
          isComplet:(e.data() as dynamic)["isComplet"],
          title: (e.data() as dynamic)["title"],
          uid: e.id,
        );
      }).toList();
    } else {
      return null;
    }
  }

  Stream<List<TodoVar>?> listTodos() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }
}
