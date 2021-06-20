import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/providers/sprint_provider.dart';
import 'package:ed_app/providers/task_in_sprint_provider.dart';
import 'package:flutter/material.dart';

class SprintDataBlock extends ChangeNotifier {
  SprintProvider sprintProvider;
  TaskInSprintProvider taskInSprintProvider;

  Sprint _sprint;
  List<TaskInSprint> _tasksInSprint;

  void update(SprintProvider sprintProvider,
      TaskInSprintProvider taskInSprintProvider) {
    this.sprintProvider = sprintProvider;
    this.taskInSprintProvider = taskInSprintProvider;

    _sprint = this.sprintProvider.getCurrentSprint();

    if (_sprint != null) {
      _tasksInSprint = this.taskInSprintProvider.getTasksBySprintId(_sprint.id);
    }
    
    notifyListeners();
  }

  Sprint getCurrentSprint() {
    return _sprint;
  }

  List<TaskInSprint> getCurrentSprintTasks() {
    return _tasksInSprint;
  }

  void changeTaskStatus(String taskId, TaskInSprintStatus status) {
    taskInSprintProvider.changeTaskStatus(taskId, status);
  }
}
