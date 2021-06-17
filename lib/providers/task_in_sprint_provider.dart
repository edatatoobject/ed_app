import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:flutter/material.dart';

class TaskInSprintProvider extends ChangeNotifier {
  List<TaskInSprint> _items = DummyData.taskInSprint;

  List<TaskInSprint> get items => [..._items];

  List<TaskInSprint> getTasksBySprintId(String sprintId) {
    return _items.where((element) => element.sprintId == sprintId).toList();
  }
}
