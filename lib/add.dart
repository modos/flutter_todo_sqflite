import 'package:flutter/material.dart';
import 'package:flutter_app/todo.dart';
import 'db_helper.dart' as db;
class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController idController = new TextEditingController();
    TextEditingController titleController = new TextEditingController();
    TextEditingController descriptionController = new TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Add a todo")
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              children: [
                TextField(decoration:
                InputDecoration(hintText: "id", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                  controller: idController,),

                SizedBox(height: 30,),

                TextField(decoration:
                  InputDecoration(hintText: "Title", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                controller: titleController,),

                SizedBox(height: 30,),

                TextField(decoration:
                InputDecoration(hintText: "Description", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                controller: descriptionController,),

                SizedBox(height: 30,),

                MaterialButton(
                  onPressed: (){
                    db.insert(new Todo(id: int.parse(idController.text), title: titleController.text, description: descriptionController.text));
                  },
                  color: Colors.blue,
                  child: Text("Submit", style: TextStyle(fontSize: 20, color: Colors.white),),
                )
              ],
            ),
          ),
        )
    );
  }
}
