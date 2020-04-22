import 'package:flutter/material.dart';
import 'package:todo/ui/list/list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter to-do list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: List(),
    );
  }
}