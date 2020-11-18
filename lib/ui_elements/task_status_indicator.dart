import 'package:ed_app/enums/task_status.dart';
import 'package:flutter/cupertino.dart';

class TaskStatusIndicator extends StatelessWidget {
  final TaskStatus taskStatus;

  const TaskStatusIndicator({Key key, @required this.taskStatus})
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
