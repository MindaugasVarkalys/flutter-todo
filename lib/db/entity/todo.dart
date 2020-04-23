import 'package:floor/floor.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final bool done;
  final String title;
  final int color;
  final int dueDateTimestamp;

  Todo(this.id, this.done, this.title, this.color, this.dueDateTimestamp);
}
