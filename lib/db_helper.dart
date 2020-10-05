import 'package:flutter/material.dart';
import 'package:flutter_app/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> init() async {

  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(

    join(await getDatabasesPath(), 'todo_database.db'),

    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, description TEXT)",
      );
    },

    version: 1,
  );

  return database;
}

Future<void> insert(Todo todo) async {
  final db = await init();
  
  db.insert('todos', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Todo>> todos() async {

  final  db = await init();

  final List<Map<String, dynamic>> maps = await db.query('todos');

  return List.generate(maps.length, (i) {
    return Todo(
      id: maps[i]['id'],
      title: maps[i]['title'],
      description: maps[i]['description'],
    );
  });
}