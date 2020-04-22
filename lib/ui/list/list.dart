import 'package:flutter/material.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do list"),
      ),
      body: Text("Hi"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Pressed"),
        tooltip: 'Add',
        child: Icon(Icons.add),
      )
    );
  }
}
