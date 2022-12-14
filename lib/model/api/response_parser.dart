import 'package:flutter_todo/model/data/todo.dart';

class ResponseParser {
  List<Todo> parseTodoList(Iterable<dynamic>? todos) {
    return todos?.map((todo) => parseTodo(todo)).toList() ?? List.empty();
  }

  Todo parseTodo(dynamic todo) {
    return Todo(
      id: todo["id"],
      title: todo["title"],
      completed: todo["completed"],
    );
  }
}
