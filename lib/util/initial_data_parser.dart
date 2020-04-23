import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/db/entity/todo.dart';

class InitialDataParser {

  final BuildContext _context;

  InitialDataParser(this._context);

  Future<List<Todo>> parse() async {
    final json = await DefaultAssetBundle.of(_context).loadString("assets/initial_data.json");
    final Iterable<dynamic> parsed = jsonDecode(json);
    return parsed.map((jsonEntry) => Todo.fromJson(jsonEntry)).toList();
  }
}