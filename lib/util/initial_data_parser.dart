import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/db/entity/todo.dart';

class InitialDataParser {

  final BuildContext context;

  InitialDataParser(this.context);

  Future<List<Todo>> parse() async {
    final json = await DefaultAssetBundle.of(context).loadString("assets/initial_data.json");
    final Iterable<dynamic> parsed = jsonDecode(json);
    return parsed.map((jsonEntry) => Todo.fromJson(jsonEntry));
  }
}