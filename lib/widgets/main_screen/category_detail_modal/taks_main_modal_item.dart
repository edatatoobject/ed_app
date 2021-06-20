import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/ui_elements/task_in_sprint_status_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskMainModalItem extends StatefulWidget {
  const TaskMainModalItem({this.tasks, this.tasksInSprint, Key key})
      : super(key: key);

  final List<Task> tasks;
  final List<TaskInSprint> tasksInSprint;

  @override
  _TaskMainModalItemState createState() => _TaskMainModalItemState();
}

class _TaskMainModalItemState extends State<TaskMainModalItem> {
  ElevatedButton getMainActionButton(
      BuildContext context, TaskInSprintStatus status) {
    switch (status) {
      case TaskInSprintStatus.Current:
        return ElevatedButton(
          onPressed: () => Navigator.pop(context, TaskInSprintStatus.Done),
          child: const Text(
            'Done',
            style: TextStyle(color: Colors.green),
          ),
        );
      case TaskInSprintStatus.Done:
        return ElevatedButton(
          onPressed: () => Navigator.pop(context, TaskInSprintStatus.Current),
          child: const Text(
            'Undone',
            style: TextStyle(color: Colors.cyan),
          ),
        );
      case TaskInSprintStatus.Moved:
        return null;
      case TaskInSprintStatus.Canceled:
        return ElevatedButton(
          onPressed: () => Navigator.pop(context, TaskInSprintStatus.Current),
          child: const Text(
            'Restore',
            style: TextStyle(color: Colors.cyan),
          ),
        );
    }
  }

  void showTaskDialog(BuildContext context, String taskId) async {
    var task = widget.tasks.firstWhere((task) => task.id == taskId);

    var tasksInSrint =
        Provider.of<SprintDataBlock>(context, listen: false).getCurrentSprintTasks();

    var taskInSprint = tasksInSrint
        .firstWhere((taskInSprint) => taskInSprint.taskId == taskId);

    var dialogResult = await showDialog<TaskInSprintStatus>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              elevation: 0,
              title: Text(task.value),
              content: Text(task.description == null
                  ? "No description"
                  : task.description),
              actions: [
                getMainActionButton(context, taskInSprint.status),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
              ],
            ));

    if (dialogResult == null) {
      return;
    }

    setState(() {
      Provider.of<SprintDataBlock>(context, listen: false)
          .changeTaskStatus(taskInSprint.id, dialogResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    var tasksInSrint =
        Provider.of<SprintDataBlock>(context).getCurrentSprintTasks();

    return Column(
        children: widget.tasks.map((task) {
      return InkWell(
        onTap: () => showTaskDialog(context, task.id),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  task.value,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                Spacer(),
                TaskIsSprintStatusIndicator(
                    taskStatus: tasksInSrint
                        .firstWhere((element) => element.taskId == task.id)
                        .status)
              ],
            ),
          ),
        ),
      );
    }).toList());
  }
}
