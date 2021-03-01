import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/ui_elements/task_status_indicator.dart';
import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final String value;
  final TaskStatus status;

  const TaskListItem({Key key, @required this.value, @required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value),
        Spacer(),
        TaskStatusIndicator(
          taskStatus: status,
        )
      ],
    );
  }
}
