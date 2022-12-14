import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/todo_bloc.dart';
import 'package:flutter_todo/ui/todo_list/todo_list.dart';
import 'package:get_it/get_it.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todoBloc = GetIt.I.get<TodoBloc>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    todoBloc.getTodos();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextField(controller: _controller)),
                  ElevatedButton(
                      onPressed: () {
                        todoBloc.addTodo(_controller.text);
                        _controller.clear();
                      },
                      child: const Text("Add"))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TodoList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
