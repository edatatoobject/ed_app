import 'package:ed_app/enums/task_status.dart';

class Task {
  final String id;
  final String value;
  final String description;
  final String subcategoryId;
  final TaskStatus status;

  Task({this.id, this.value, this.description , this.subcategoryId, this.status});
}
