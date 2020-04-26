import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/repository/todo_repository.dart';
import 'package:todo/ui/todo_list/todo_list_page.dart';
import 'package:todo/util/initial_data_parser.dart';

import 'bloc/todo_bloc.dart';
import 'db/database.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppDatabase>(
      future: AppDatabase.init(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) return Container();

        final database = snapshot.data;
        return MultiProvider(
          providers: [
            Provider<TodoRepository>(create: (_) => TodoRepository(database.todoDao, InitialDataParser(context))),
            Provider<TodoBloc>(create: (context) => TodoBloc(Provider.of<TodoRepository>(context, listen: false))),
          ],
          child: MaterialApp(
            title: 'Flutter to-do list',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: TodoListPage(),
          ),
        );
      },
    );
  }
}
