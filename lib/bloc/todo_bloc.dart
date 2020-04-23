import 'package:rxdart/rxdart.dart';
import 'package:todo/db/dao/todo_dao.dart';
import 'package:todo/db/entity/todo.dart';

class TodoBloc {
  final TodoDao _todoDao;

  final _todosSubject = PublishSubject<List<Todo>>();
  Stream<List<Todo>> get todos => _todosSubject.stream;

  TodoBloc(this._todoDao);

  saveTodo(Todo todo) async {
    await _todoDao.insertTodo(todo);
    fetchTodos();
  }

  fetchTodos() async {
    final todos = await _todoDao.findAll();
    _todosSubject.add(todos);
  }
}