import 'package:flutter/material.dart';
import 'package:todo/ui/todo_list/todo_list.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do list"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("PRESSED"),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      body: TodoList(),
    );
  }
}
