import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:flutter/material.dart';

class TaskInSprintProvider extends ChangeNotifier {
  List<TaskInSprint> _items = DummyData.taskInSprint;

  List<TaskInSprint> get items => [..._items];

  List<TaskInSprint> getTasksBySprintId(String sprintId) {
    return _items.where((element) => element.sprintId == sprintId).toList();
  }

  void changeTaskStatus(String taskId, TaskInSprintStatus status) {
    var index = _findIndex(taskId);

    var task = _items[index];

    var newTask = TaskInSprint(
        id: task.id,
        sprintId: task.sprintId,
        status: status,
        taskId: task.taskId);

    _items[index] = newTask;

    notifyListeners();
  }

  int _findIndex(String taskId) {
    return _items.indexWhere((element) => element.id == taskId);
  }
}
