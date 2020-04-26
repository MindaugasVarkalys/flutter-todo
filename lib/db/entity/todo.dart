import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int id;
  bool done;
  String title;
  int color;
  int dueDateTimestamp;

  Todo(this.id, this.done, this.title, this.color, this.dueDateTimestamp);

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        null,
        json["done"],
        json["title"],
        json["color"],
        json["dueDateTimestamp"],
      );

  static Map<String, int> colors = {
    "Red": Colors.red.value,
    "Blue": Colors.blue.value,
    "Green": Colors.green.value,
    "Yellow": Colors.yellow.value,
    "Purple": Colors.purple.value,
    "Pink": Colors.pink.value,
    "Orange": Colors.orange.value,
    "Black": Colors.black.value,
  };
}
