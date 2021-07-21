import 'package:flutter/material.dart';

enum TaskStatus { ToDo, Done }

MaterialColor getStatusColor(TaskStatus status) {
  if (status == TaskStatus.ToDo) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}

String getStatusName(TaskStatus status) {
  if (status == TaskStatus.ToDo) {
    return "ToDo";
  } else {
    return "Done";
  }
}

int getStatusIndex(TaskStatus status) {
    if (status == TaskStatus.ToDo) {
      return 0;
    } else {
      return 1;
    }
  }

  TaskStatus getStatusFromIndex(int index) {
    if (index == 0) {
      return TaskStatus.ToDo;
    } else {
      return TaskStatus.ToDo;
    }
  }
