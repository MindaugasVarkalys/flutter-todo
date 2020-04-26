import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/ui/todo_details/color_dropdown.dart';
import 'package:todo/ui/todo_details/date_time_field.dart';

class TodoDetailsForm extends StatefulWidget {
  final Todo todo;

  const TodoDetailsForm({Key key, @required this.todo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TodoDetailsFormState();
  }
}

class _TodoDetailsFormState extends State<TodoDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  _onSaveClick() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Provider.of<TodoBloc>(context, listen: false).saveTodo(widget.todo);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: widget.todo.title,
            decoration: InputDecoration(
              labelText: "Title", filled: true, helperText: " ", // Needed so that layout does not move when error appears
            ),
            validator: (value) => value.isEmpty ? "Please insert title" : null,
            onSaved: (value) => widget.todo.title = value,
          ),
          ColorDropdown(
            value: widget.todo.color,
            onChanged: (value) => setState(() => widget.todo.color = value),
          ),
          DateTimeField(
            timestamp: widget.todo.dueDateTimestamp,
            onChanged: (value) => widget.todo.dueDateTimestamp = value,
          ),
          CheckboxListTile(
            title: Text("Done"),
            value: widget.todo.done,
            onChanged: (value) => setState(() => widget.todo.done = value),
          ),
          RaisedButton(
            child: Text("SAVE"),
            onPressed: _onSaveClick,
          ),
        ],
      ),
    );
  }
}
