import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:flutter/material.dart';

class TaskIsSprintStatusIndicator extends StatelessWidget {
  final TaskInSprintStatus taskStatus;

  const TaskIsSprintStatusIndicator({Key key, @required this.taskStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = getStatusColor(taskStatus);
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(3)),
      child: Center(child: Text(getStatusName(taskStatus), style: TextStyle(color: color),)),
    );
  }
}
