import 'package:ed_app/enums/task_in_sprint_status.dart';

class TaskInSprint {
  final String id;
  final String sprintId;
  final String taskId;
  final TaskInSprintStatus status;

  TaskInSprint({this.id, this.sprintId, this.taskId, this.status});

  Map<String, dynamic> toMap() {
    return {
      "sprintId": sprintId,
      "taskId": taskId,
      "status": getFromStatus(status),
    };
  }

  static TaskInSprint fromMap(String id, Map<String, dynamic> mapData) {
    return TaskInSprint(
        id: id,
        sprintId: mapData["sprintId"],
        taskId: mapData["taskId"],
        status: getFromIndex(mapData["status"]));
  }

  static TaskInSprint fromTaskInSprint(String id, TaskInSprint taskInSprint) {
    return TaskInSprint(
        id: id,
        sprintId: taskInSprint.sprintId,
        taskId: taskInSprint.taskId,
        status: taskInSprint.status);
  }
}
