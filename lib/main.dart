import 'package:flutter/material.dart';
import 'package:flutter_app/add.dart';
import 'package:flutter_app/todo.dart';
import 'db_helper.dart' as db;
void main() {
  runApp(new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Todo> todos = new List();

  @override
  void initState() {
    super.initState();
      db.insert(new Todo(id: 1, title: 'a title', description: 'a description'));
      db.insert(new Todo(id: 2, title: '2 title', description: '2 description'));
      db.insert(new Todo(id: 3, title: '3 title', description: '3 description'));
      db.todos().then((value) => value.forEach((element) {todos.add(element);}));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Todo app"),
        ),
        body: todos.length == 0 ? Text("Loading..."):
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Text(todos[index].title, style: TextStyle(fontSize: 40),),
                              Text(todos[index].description),
                              SizedBox(height: 10,)
                            ],
                          );
                        }
                  )
                  ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add()),
                      );
                    },
                    color: Colors.blue,
                    child: Text("Add", style: TextStyle(fontSize: 20, color: Colors.white),),
                  )
                ],
              ),
      );
  }
}
