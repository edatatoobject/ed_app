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
      _tasksInSprint = this.taskInSprintProvider.getBySprintId(_sprint.id);
    }

    notifyListeners();
  }

  // ----- Sprints -----

  Sprint getCurrentSprint() {
    return _sprint;
  }

  Sprint getSprintById(String sprintId) {
    var sprints = sprintProvider.getAll();

    return sprints.firstWhere((sprint) => sprint.id == sprintId);
  }

  Sprint getLastSprint() {
    return _getSortedSprints().first;
  }

  Sprint getPreviosSprint() {
    var sortedSprints = _getSortedSprints();

    if (sortedSprints == null && sortedSprints.length == 1) {
      return null;
    }

    return sortedSprints[1];
  }

  List<Sprint> _getSortedSprints() {
    var sprints = sprintProvider.getAll();

    if (sprints == null) {
      return null;
    }

    sprints.sort((u1, u2) => u1.toString().compareTo(u2.toString()));

    return sprints;
  }

  void createSprint(Sprint sprint) {
    sprintProvider.add(sprint);
  }

  void updateSprint(Sprint sprint) {
    sprintProvider.update(sprint);
  }

  // ----- Tasks -----

  List<TaskInSprint> getCurrentSprintTasks() {
    return _tasksInSprint;
  }

  List<TaskInSprint> getSprintTasks(String sprintId) {
    return taskInSprintProvider.getBySprintId(sprintId);
  }

  Future createTasks(List<TaskInSprint> tasksInSprint) async {
    for (var taskInSprint in tasksInSprint) {
      await taskInSprintProvider.add(taskInSprint);
    }

    notifyListeners();
  }

  Future changeTaskStatus(String taskId, TaskInSprintStatus status) async {
    var oldTask = taskInSprintProvider.getById(taskId);

    var newTask = TaskInSprint(
        id: taskId,
        sprintId: oldTask.sprintId,
        taskId: oldTask.taskId,
        status: status);

    await taskInSprintProvider.update(taskId, newTask);
  }

  Future updateTasks(List<TaskInSprint> tasksInSprint, String sprintId) async {
    var tasks = taskInSprintProvider.getBySprintId(sprintId);

    var removedTasks = tasks
        .where((taskInSprint) =>
            taskInSprint.sprintId == sprintId &&
            !tasksInSprint.contains(taskInSprint.id))
        .map((taskInSprint) => taskInSprint.id);

    var notChangedTasks = tasks.where((task) => !removedTasks.contains(task.id));

    var addedTasks = tasksInSprint
        .where((taskInSprint) => notChangedTasks.contains(taskInSprint.id)).toList();

    await taskInSprintProvider.updateTasksInSprint(addedTasks, removedTasks);
  }
}
