import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/ui/todo_details/todo_details_page.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  const TodoListItem({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(decoration: todo.done ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      subtitle: Text("Due date: ${DateFormat("yyyy-MM-dd HH:mm").format(DateTime.fromMillisecondsSinceEpoch(todo.dueDateTimestamp))}"),
      trailing: _ColorBox(color: todo.color),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TodoDetailsPage(todo: todo))),
    );
  }
}

class _ColorBox extends StatelessWidget {
  final int color;

  const _ColorBox({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
