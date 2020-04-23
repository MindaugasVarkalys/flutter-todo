import 'package:floor/floor.dart';
import 'package:todo/db/entity/todo.dart';

@dao
abstract class TodoDao {
  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertTodo(Todo todo);

  @Query('SELECT * FROM Todo')
  Future<List<Todo>> findAll();
}