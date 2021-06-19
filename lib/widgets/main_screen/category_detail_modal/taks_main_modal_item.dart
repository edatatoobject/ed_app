import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/ui_elements/task_in_sprint_status_indicator.dart';
import 'package:flutter/material.dart';

class TaskMainModalItem extends StatelessWidget {
  const TaskMainModalItem({this.tasks, this.tasksInSprint, Key key})
      : super(key: key);

  final List<Task> tasks;
  final List<TaskInSprint> tasksInSprint;

  ElevatedButton getMainActionButton(
      BuildContext context, TaskInSprintStatus status) {
    switch (status) {
      case TaskInSprintStatus.Current:
        return ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Done'),
          child: const Text(
            'Done',
            style: TextStyle(color: Colors.green),
          ),
        );
      case TaskInSprintStatus.Done:
        return ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Undone'),
          child: const Text(
            'Undone',
            style: TextStyle(color: Colors.cyan),
          ),
        );
      case TaskInSprintStatus.Moved:
        return null;
      case TaskInSprintStatus.Canceled:
        return ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Restore'),
          child: const Text(
            'Restore',
            style: TextStyle(color: Colors.cyan),
          ),
        );
    }
  }

  void showTaskDialog(BuildContext context, String taskId) async {
    var task = tasks.firstWhere((task) => task.id == taskId);
    var taskInSprint = tasksInSprint
        .firstWhere((taskInSprint) => taskInSprint.taskId == taskId);

    var dialogResult = await showDialog<String>(
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
    print(dialogResult);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: tasks.map((task) {
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
                    taskStatus: tasksInSprint
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
