import 'package:flutter/material.dart';

class TasksPicker extends StatefulWidget {
  const TasksPicker({Key key, this.pickedSubcategories, this.pickTasksBackcall})
      : super(key: key);

  final List<String> pickedSubcategories;
  final Function(List<String>) pickTasksBackcall;

  @override
  _TasksPickerState createState() => _TasksPickerState();
}

class _TasksPickerState extends State<TasksPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text("heh")
    );
  }
}
