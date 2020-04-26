import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/db/entity/todo.dart';
import 'package:todo/ui/todo_details/color_dropdown.dart';
import 'package:todo/ui/todo_details/date_time_field.dart';

class TodoDetailsForm extends StatefulWidget {
  final Todo todo;

  const TodoDetailsForm({Key key, this.todo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TodoDetailsFormState(todo);
  }
}

class _TodoDetailsFormState extends State<TodoDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  Todo _formState;

  _TodoDetailsFormState(Todo todo) {
    _formState = Todo(    // Copy has to be made to not modify values outside of this widget
      todo?.id,
      todo?.done ?? false,
      todo?.title ?? "",
      todo?.color ?? Todo.colors["Red"],
      todo?.dueDateTimestamp ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  _onSaveClick() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Provider.of<TodoBloc>(context, listen: false).saveTodo(_formState);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _formState.title,
            decoration: InputDecoration(
              labelText: "Title", filled: true, helperText: " ", // Needed so that layout does not move when error appears
            ),
            validator: (value) => value.isEmpty ? "Please insert title" : null,
            onChanged: (value) => _formState.title = value,
          ),
          ColorDropdown(
            value: _formState.color,
            onChanged: (value) => setState(() => _formState.color = value),
          ),
          DateTimeField(
            timestamp: _formState.dueDateTimestamp,
            onChanged: (value) => _formState.dueDateTimestamp = value,
          ),
          CheckboxListTile(
            title: Text("Done"),
            value: _formState.done,
            onChanged: (value) => setState(() => _formState.done = value),
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
