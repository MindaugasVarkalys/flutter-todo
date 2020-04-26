import 'package:flutter/material.dart';
import 'package:todo/db/entity/todo.dart';

class ColorDropdown extends StatelessWidget {
  final int value;
  final Function(int) onChanged;

  const ColorDropdown({Key key, @required this.value, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: "Color",
        filled: true,
        helperText: ' ',
      ),
      value: value,
      onChanged: onChanged,
      items: Todo.colors.entries
          .map(
            (entry) => DropdownMenuItem<int>(
              value: entry.value,
              child: _ColorDropdownItem(color: entry.value, name: entry.key),
            ),
          )
          .toList(),
    );
  }
}

class _ColorDropdownItem extends StatelessWidget {
  final int color;
  final String name;

  const _ColorDropdownItem({Key key, this.color, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        Text(name),
      ],
    );
  }
}
