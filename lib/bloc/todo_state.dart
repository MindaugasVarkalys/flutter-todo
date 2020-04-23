import 'package:todo/db/entity/todo.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}