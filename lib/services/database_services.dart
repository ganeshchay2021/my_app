import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  //singleton class
  DatabaseServices._();
  static final DatabaseServices databaseInstance = DatabaseServices._();

  Database? myDatabase;

  static final String TABLE_NAME = "todo";

  Future<Database?> getDatabase() async {
    if (myDatabase != null) {
      return myDatabase;
    } else {
      myDatabase = await openDb();
      return myDatabase;
    }
  }

  Future<Database> openDb() async {
    final Directory appDir = await getApplicationDocumentsDirectory();

    String path = join(appDir.path, "TodoDB.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, createDate TEXT, isCompleted INTEGER)",
        );
      },
    );
  }

  Future<bool> addTodo({
    required String title,
    required String description,
    required String createDate,
    required int isCompleted,
  }) async {
    final db = await getDatabase();
    int rowsAffected = await db!.insert(TABLE_NAME, {
      "title": title,
      "description": description,
      "createDate": createDate,
      "isCompleted": isCompleted,
    });
    return rowsAffected > 0;
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> myData = await db!.query(TABLE_NAME);
    return myData;
  }

  Future<bool> updateTask(int id, String title, String description) async {
    final db = await getDatabase();
    int rowsAffected = await db!.update(TABLE_NAME, {
      "title": title,
      "description": description,
    }, where: "id = $id");
    return rowsAffected > 0;
  }

  Future<bool> deleteTodo(int id) async {
    final db = await getDatabase();
    int rowsAffected = await db!.delete(TABLE_NAME, where: "id =$id");
    return rowsAffected > 0;
  }

  Future<bool> toggle(int id, int isCompleted) async {
    final db = await getDatabase();
    int rowsAffected = await db!.update(TABLE_NAME, {
      "isCompleted": isCompleted,
    }, where: "id =$id");
    return rowsAffected > 0;
  }

  
}
