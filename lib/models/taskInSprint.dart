import 'package:ed_app/enums/task_in_sprint_status.dart';

class TaskInSprint {
  final String id;
  final String sprintId;
  final String taskId;
  final TaskInSprintStatus status;

  TaskInSprint({this.id, this.sprintId, this.taskId, this.status});
}
