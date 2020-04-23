import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/bloc/todo_state.dart';
import 'package:todo/ui/todo_list/todo_list_item.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TodoBloc>(context, listen: false);
    bloc.fetchTodos();
    return StreamBuilder(
      stream: bloc.todos,
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data is TodoLoaded) {
          final todoLoaded = snapshot.data as TodoLoaded;
          return ListView.separated(
            itemCount: todoLoaded.todos.length,
            itemBuilder: (_, i) => TodoListItem(todo: todoLoaded.todos[i]),
            separatorBuilder: (c, _) => Divider(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}