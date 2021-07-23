import 'package:flutter/material.dart';

enum TaskInSprintStatus { Current, Done, Moved, Canceled }

TaskInSprintStatus getFromIndex(int index) {
  switch (index) {
    case 1:
      return TaskInSprintStatus.Current;
    case 2:
      return TaskInSprintStatus.Done;
    case 3:
      return TaskInSprintStatus.Moved;
    case 4:
      return TaskInSprintStatus.Canceled;
    default:
      throw new Exception("# TaskInSprintStatus.getFromIndex(): Index is out of range.");
  }
}

int getFromStatus(TaskInSprintStatus status) {
  switch (status) {
    case TaskInSprintStatus.Current:
      return 1;
    case TaskInSprintStatus.Done:
      return 2;
    case TaskInSprintStatus.Moved:
      return 3;
    case TaskInSprintStatus.Canceled:
      return 4;
    default:
      throw new Exception("# TaskInSprintStatus.getFromStatus(): Status error.");
  }
}

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
    default:
      throw new Exception("TaskInSprintStatus.getStatusColor: Status error");
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
    default:
      throw new Exception("TaskInSprintStatus.getStatusName: Status error");
  }
}
