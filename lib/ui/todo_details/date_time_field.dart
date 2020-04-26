import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeField extends StatefulWidget {
  final int timestamp;
  final Function(int) onChanged;

  const DateTimeField({Key key, @required this.timestamp, @required this.onChanged}) : super(key: key);

  @override
  _DateTimeFieldState createState() => _DateTimeFieldState(date: DateTime.fromMillisecondsSinceEpoch(timestamp));
}

class _DateTimeFieldState extends State<DateTimeField> {
  final DateFormat _dateFormat = DateFormat("yyyy-MM-dd");
  final DateFormat _timeFormat = DateFormat("HH:mm");

  TextEditingController _dateController;
  TextEditingController _timeController;

  DateTime date;

  _DateTimeFieldState({this.date}) : super() {
    _dateController = new TextEditingController(text: _dateFormat.format(date));
    _timeController = new TextEditingController(text: _timeFormat.format(date));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _dateController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Due date",
              filled: true,
            ),
            onTap: () async {
              date = await showDatePicker(context: context, initialDate: date, firstDate: DateTime.fromMicrosecondsSinceEpoch(0), lastDate: DateTime.fromMicrosecondsSinceEpoch(8640000000000000));
              _dateController.text = _dateFormat.format(date);
              widget.onChanged(date.millisecondsSinceEpoch);
            }
          ),
        ),
        Container(width: 16),
        Expanded(
          child: TextFormField(
            controller: _timeController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Due time",
              filled: true,
            ),
            onTap: () async {
              final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(date));
              date = DateTime(date.year, date.month, date.day, time.hour, time.minute);
              _timeController.text = _timeFormat.format(date);
              widget.onChanged(date.millisecondsSinceEpoch);
            }
          ),
        ),
      ],
    );
  }
}
