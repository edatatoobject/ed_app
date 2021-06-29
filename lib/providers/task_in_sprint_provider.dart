import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:flutter/material.dart';

class TaskInSprintProvider extends ChangeNotifier {
  List<TaskInSprint> _items = DummyData.taskInSprint;

  List<TaskInSprint> get items {
    if (_items == null) return null;

    return [..._items];
  }

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

  void addTasksInSprint(List<TaskInSprint> tasks) {
    _items.addAll(tasks);

    notifyListeners();
  }

  void updateTasksInSprint(List<TaskInSprint> tasks, String sprintId) {
    _items.removeWhere((taskInSprint) =>
        taskInSprint.sprintId == sprintId &&
        !tasks.contains(taskInSprint.taskId));

    var sprintTasks = _items
        .where((task) => task.sprintId == sprintId)
        .map((task) => task.taskId)
        .toList();
    tasks.removeWhere((newTask) => sprintTasks.contains(newTask.taskId));

    _items.addAll(tasks);

    notifyListeners();
  }
}
