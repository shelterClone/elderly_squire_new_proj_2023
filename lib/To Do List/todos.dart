import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/database_services.dart';
import 'package:elderly_squire_2023_remastered_v2/To%20Do%20List/todovar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loading.dart';



class TodoLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text(snapshot.error.toString())),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Todos(),
          theme: ThemeData(
            // scaffoldBackgroundColor: Colors.grey[800],
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.teal,
            // primarySwatch: Colors.red,
          ),
        );
      },
    );
  }
}

class Todos extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<Todos> {
  bool isComplet = false; // just for now
  TextEditingController todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
            child: Icon(Icons.arrow_back)
        ),
        centerTitle: true,
        toolbarHeight: 75,
        backgroundColor: Colors.blueGrey[900],
        title: Image.asset('assets/images/todolist.png',height: 40, width: 125)
      ),
      body: Center(
        child: StreamBuilder<List<TodoVar>?>(
            stream: DatabaseService().listTodos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }
              List<TodoVar>? todos = snapshot.data;
              return Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "To-Do list",
                          style: TextStyle(
                            fontSize: 25,
                            // color: Colors.white,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontFamily: ('BebasNeue')
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    SizedBox(height: 20),
                    // ListView.separated(
                    ListView.builder(
                    //   separatorBuilder: (context, index) => Divider(
                    //     // color: Colors.grey[800],
                    //     color: Colors.grey[500],
                    //   ),
                      shrinkWrap: true,
                      itemCount: todos!.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(todos[index].title),
                          background: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.delete),
                            color: Colors.teal[400],
                          ),
                          onDismissed: (direction) async {
                            await DatabaseService()
                                .removeTodo(todos[index].uid,
                            );
                            //
                          },
                          child: ListTile(
                            onTap: () {
                              DatabaseService().completTask(todos[index].uid);
                            },
                            leading: Container(
                              padding: EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: todos[index].isComplet
                                  ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                                  : Container(),
                            ),
                            title: Text(
                              todos[index].title,
                              style: TextStyle(
                                fontSize: 20,
                                // color: Colors.grey[200],
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    // )
                    )],
                ),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            builder: (context) => SimpleDialog(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              backgroundColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Row(
                children: [
                  Text(
                    "Add Todo",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              children: [
                Divider(),
                TextFormField(
                  controller: todoTitleController,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "eg. exercise",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    ),
                    child: Text("Add"),

                    onPressed: () async {
                      if (todoTitleController.text.isNotEmpty) {
                        await DatabaseService()
                            .createNewTodo(todoTitleController.text.trim());
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ), context: context,
          );
        },
      ),
    );
  }
}

