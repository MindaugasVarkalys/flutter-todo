import 'dart:async';

import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:todo/db/dao/todo_dao.dart';
import 'package:todo/db/entity/todo.dart';

part 'database.g.dart';

// Run when something is changed: flutter packages pub run build_runner build
@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;

  static Future<AppDatabase> init() => $FloorAppDatabase.databaseBuilder("todo.db").build();
}
