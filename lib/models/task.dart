import 'package:ed_app/enums/task_status.dart';
import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String value;
  final String description;
  final String subcategoryId;
  final TaskStatus status;

  Task(
      {this.id,
      @required this.value,
      this.description,
      @required this.subcategoryId,
      this.status});

  Map<String, dynamic> toMap() {
    return {
      "name": value,
      "description": description,
      "subcategoryId": subcategoryId,
      "status": getStatusIndex(status)
    };
  }

  static Task fromMap(String id, Map<String, dynamic> mapData) {
    return Task(
        id: id,
        value: mapData["name"],
        description: mapData["description"],
        subcategoryId: mapData["subcategoryId"],
        status: getStatusFromIndex(mapData["status"]));
  }

  static Task fromTask(String id, Task task) {
    return Task(
        id: id,
        subcategoryId: task.subcategoryId,
        value: task.value,
        description: task.description,
        status: task.status);
  }
}
