import 'package:rxdart/rxdart.dart';
import 'package:todo/bloc/todo_state.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/repository/todo_repository.dart';

class TodoBloc {
  final TodoRepository _todoRepository;

  final _todosSubject = PublishSubject<TodoState>();
  Stream<TodoState> get todos => _todosSubject.stream;

  TodoBloc(this._todoRepository);

  saveTodo(Todo todo) async {
    _todosSubject.add(TodoLoading());
    await _todoRepository.save(todo);
    final todos = await _todoRepository.findAll();
    _todosSubject.add(TodoLoaded(todos));
  }

  fetchTodos() async {
    _todosSubject.add(TodoLoading());
    final todos = await _todoRepository.findAll();
    _todosSubject.add(TodoLoaded(todos));
  }
}