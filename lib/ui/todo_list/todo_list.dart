import 'package:flutter/material.dart';
import 'package:flutter_todo/bloc/api_data.dart';
import 'package:flutter_todo/bloc/todo_bloc.dart';
import 'package:flutter_todo/model/data/todo.dart';
import 'package:flutter_todo/ui/todo_list/todo_list_item.dart';
import 'package:get_it/get_it.dart';

class TodoList extends StatelessWidget {
  final todoBloc = GetIt.I.get<TodoBloc>();

  TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: todoBloc.todos,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Error loading todos"),
              ElevatedButton(
                onPressed: () => todoBloc.getTodos(),
                child: const Text("Retry"),
              )
            ],
          );
        }
        if (snapshot.data is ApiDataLoaded) {
          final todos = snapshot.data as ApiDataLoaded<List<Todo>>;
          return ListView.separated(
            itemCount: todos.data.length,
            itemBuilder: (_, i) => TodoListItem(todo: todos.data[i]),
            separatorBuilder: (c, _) => const Divider(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
