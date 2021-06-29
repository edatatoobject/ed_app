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

  void createSprint(Sprint sprint) {
    sprintProvider.addSprint(sprint);
  }

  void updateSprint(Sprint sprint) {
    sprintProvider.updateSprint(sprint);
  }

  Sprint getSprintById(String sprintId) {
    var sprints = sprintProvider.items;

    return sprints.firstWhere((sprint) => sprint.id == sprintId);
  }

  Sprint getCurrentSprint() {
    return _sprint;
  }

  Sprint getLastSprint() {
    return getSortedSprints().first;
  }

  Sprint getPreviosSprint() {
    var sortedSprints = getSortedSprints();

    if (sortedSprints == null && sortedSprints.length == 1) {
      return null;
    }

    return getSortedSprints()[1];
  }

  List<Sprint> getSortedSprints() {
    var sprints = sprintProvider.items;

    if (sprints == null) {
      return null;
    }

    sprints.sort((u1, u2) => u1.toString().compareTo(u2.toString()));

    return sprints;
  }

  void createTasks(List<TaskInSprint> tasks) {
    taskInSprintProvider.addTasksInSprint(tasks);
  }

  void updateTasks(List<TaskInSprint> tasks, String sprintId) {
    taskInSprintProvider.updateTasksInSprint(tasks, sprintId);
  }

  List<TaskInSprint> getSprintTasks(String sprintId) {
    return taskInSprintProvider.getTasksBySprintId(sprintId);
  }

  List<TaskInSprint> getCurrentSprintTasks() {
    return _tasksInSprint;
  }

  void changeTaskStatus(String taskId, TaskInSprintStatus status) {
    taskInSprintProvider.changeTaskStatus(taskId, status);
  }
}
