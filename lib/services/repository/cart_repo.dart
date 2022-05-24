import 'dart:convert';
import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import '../../constants/strings.dart';
import '../../helper/sqlite_db_helper.dart';
import '../../models/response/rp_todo_model.dart';


class TodoRepo {
  final DatabaseHelper databaseHelper;

  TodoRepo({required this.databaseHelper,});

  //Get All all row
  Future<List<RpTodoModel>> getAllTodoList() async {
    List<RpTodoModel> todos = [];
    Database? db = await databaseHelper.database;
    var results = await db!.query(tableTodoName,orderBy: '${TodoColumn.columnDateTime} DESC',);
    for (var element in results) {
      var data = RpTodoModel.fromJson(element);
      todos.add(data);
      log('Data : ${json.encode(data)}');
    }
    return todos;
  }

  //Insert row
  Future insertTodo(RpTodoModel model) async {
    Database? db = await databaseHelper.database;
    var result = await db!.insert(
      tableTodoName,
      model.toMap(),
    );
    return result;
  }

  //Delete row
  Future<int> deleteTodo(int id) async {
    Database? db = await databaseHelper.database;
    return await db!.delete(tableTodoName,
        where: '${TodoColumn.columnId} = ?', whereArgs: [id]);
  }

  //Status update row
  Future updateTodoStatus(int id, int status) async {
    Database? db = await databaseHelper.database;
    Map<String, dynamic> row = {
      TodoColumn.columnIsComplete: status,
    };
    return await db?.update(tableTodoName, row,
        where: '${TodoColumn.columnId} = ?', whereArgs: [id]);
  }

  //update title and description row
  Future updateTodo(int id, String title, String description) async {
    Database? db = await databaseHelper.database;
    Map<String, dynamic> row = {
      TodoColumn.columnTitle: title,
      TodoColumn.columnDescription: description,
    };
    return await db?.update(tableTodoName, row,
        where: '${TodoColumn.columnId} = ?', whereArgs: [id]);
  }

}
