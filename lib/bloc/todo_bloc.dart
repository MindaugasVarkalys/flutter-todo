import 'package:rxdart/rxdart.dart';
import 'package:todo/db/dao/todo_dao.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/util/initial_data_parser.dart';

class TodoBloc {
  final TodoDao _todoDao;
  final InitialDataParser _initialDataParser;

  final _todosSubject = PublishSubject<List<Todo>>();
  Stream<List<Todo>> get todos => _todosSubject.stream;

  TodoBloc(this._todoDao, this._initialDataParser) {
    _insertInitialDataIfEmpty();
  }

  _insertInitialDataIfEmpty() async {
    final todos = await _todoDao.findAll(); // COUNT is not supported in DAO, so let's just use findAll
    if (todos.length > 0) return;

    final initialData = await _initialDataParser.parse();
    await Future.wait(initialData.map((todo) => _todoDao.insertTodo(todo)));
    fetchTodos(); // Fetch inserted todos, so the UI is updated if it's already built
  }

  saveTodo(Todo todo) async {
    await _todoDao.insertTodo(todo);
    fetchTodos();
  }

  fetchTodos() async {
    final todos = await _todoDao.findAll();
    _todosSubject.add(todos);
  }
}