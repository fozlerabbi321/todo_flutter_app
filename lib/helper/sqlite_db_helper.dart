import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/strings.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }

  Future<Database> _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    var database = await openDatabase(path, version: dbVersion,
        onCreate: (Database db, int version) async {

      await db.execute('''
            CREATE TABLE $tableTodoName(
            ${TodoColumn.columnId} INTEGER PRIMARY KEY,
            ${TodoColumn.columnTitle} TEXT,
            ${TodoColumn.columnDescription} TEXT,
            ${TodoColumn.columnIsComplete} INTEGER,
            ${TodoColumn.columnDateTime} TEXT
            
            )
            
        ''');
    });
    return database;
  }
}

class TodoColumn {
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnDescription = 'description';
  static const columnIsComplete = 'is_complete';
  static const columnDateTime = 'date_time';
}

