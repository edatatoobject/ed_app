import 'package:flutter/material.dart';

enum TaskStatus { ToDo, Done }

MaterialColor getStatusColor(TaskStatus status) {
  if (status == TaskStatus.ToDo) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}

String getStatusName(TaskStatus status){
    if (status == TaskStatus.ToDo) {
    return "ToDo";
  } else {
    return "Done";
  }
}
