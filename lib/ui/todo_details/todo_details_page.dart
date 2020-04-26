import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/ui/todo_details/todo_details_form.dart';

class TodoDetailsPage extends StatelessWidget {
  final Todo todo;

  const TodoDetailsPage({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do details"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: TodoDetailsForm(todo: todo)
      ),
    );
  }
}
