import 'package:flutter_todo/bloc/api_data.dart';
import 'package:flutter_todo/model/data/todo.dart';
import 'package:flutter_todo/model/repository/todo_repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {

  final TodoRepository todoRepository;

  final _todosSubject = BehaviorSubject<ApiData<List<Todo>>>();

  Stream<ApiData<List<Todo>>> get todos => _todosSubject.stream;

  TodoBloc(this.todoRepository);

  getTodos() async {
    _todosSubject.add(ApiDataLoading());
    try {
      final todos = await todoRepository.getTodos();
      _todosSubject.add(ApiDataLoaded(todos));
    } catch (ex) {
      _todosSubject.addError(ex);
    }
  }

  addTodo(String title) async {
    if (_todosSubject.value is ApiDataLoaded && title.isNotEmpty) {
      final loadedTodos = _todosSubject.value as ApiDataLoaded<List<Todo>>;
      _todosSubject.add(ApiDataLoading());
      try {
        final newTodo = await todoRepository.addTodo(title, false);
        loadedTodos.data.add(newTodo);
        _todosSubject.add(loadedTodos);
      } catch (ex) {
        _todosSubject.addError(ex);
      }
    }
  }
}