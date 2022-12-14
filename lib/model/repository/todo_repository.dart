import 'package:flutter_todo/model/api/api_client.dart';
import 'package:flutter_todo/model/data/todo.dart';

class TodoRepository {
  final ApiClient api;

  TodoRepository(this.api);

  Future<List<Todo>> getTodos() => api.getTodos();

  Future<Todo> addTodo(String title, bool completed) =>
      api.addTodo(title, completed);
}
