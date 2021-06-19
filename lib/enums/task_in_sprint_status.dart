import 'package:flutter/material.dart';

enum TaskInSprintStatus { Current, Done, Moved, Canceled }

MaterialColor getStatusColor(TaskInSprintStatus status) {
  switch (status) {
    case TaskInSprintStatus.Current:
      return Colors.cyan;
    case TaskInSprintStatus.Done:
      return Colors.green;
    case TaskInSprintStatus.Moved:
      return Colors.yellow;
    case TaskInSprintStatus.Canceled:
      return Colors.red;
  }
}

String getStatusName(TaskInSprintStatus status) {
  switch (status) {
    case TaskInSprintStatus.Current:
      return "Current";
    case TaskInSprintStatus.Done:
      return "Done";
    case TaskInSprintStatus.Moved:
      return "Moved";
    case TaskInSprintStatus.Canceled:
      return "Canseled";
  }
}
