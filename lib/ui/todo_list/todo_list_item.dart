import 'package:flutter/material.dart';
import 'package:flutter_todo/model/data/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      todo.title,
      style: TextStyle(decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }
}