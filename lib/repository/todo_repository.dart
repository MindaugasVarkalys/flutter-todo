import 'package:todo/db/dao/todo_dao.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/util/initial_data_parser.dart';

class TodoRepository {

  final TodoDao _todoDao;
  final InitialDataParser _initialDataParser;

  TodoRepository(this._todoDao, this._initialDataParser);

  Future<List<Todo>> findAll() async {
    final todos = await _todoDao.findAll();
    if (todos.length > 0) return todos;

    final initialData = await _initialDataParser.parse();
    await Future.wait(initialData.map((todo) => _todoDao.insertTodo(todo)));
    return _todoDao.findAll();
  }

  Future<void> save(Todo todo) => _todoDao.insertTodo(todo);
}