import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class TodoService extends ChangeNotifier {


  List<Todo> todos =[];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
//  final databaseReference  = FirebaseFirestore.instance;


  addTodo(Todo todo)async{
    todos.add(todo);
    await firestore.collection("todos").add({
      "title":todo.title,
    }).then((value){
      todo.id = todo.value.toString();
      todos.add(todo);

    });
    notifyListeners();
  }
  removeTodo(id) async {
    var index=todos.indexWhere((element) => element.id == id);
    if(index != - 1) {
      await firestore.collection("todos").doc(id).delete();
      todos.removeAt(index);
    };
    notifyListeners();
  }


  updateTodo(Todo todo)async{
    var index = todos.indexWhere((el)=>el.id == todo.id);
    if(index != -1) {
      await firestore.collection("todos").doc(todo.id).update({
        "title":todo.title,
      });
      todos[index] = todo;
    }
    notifyListeners();
  }

}



