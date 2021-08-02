import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TaskPickerItem extends StatefulWidget {
  const TaskPickerItem(
      {Key key,
      this.taskId,
      this.addTask,
      this.removeTask,
      this.isInitialActive})
      : super(key: key);

  final Function(String taskId) addTask;
  final Function(String taskId) removeTask;
  final String taskId;
  final bool isInitialActive;

  @override
  _TaskPickerItemState createState() => _TaskPickerItemState();
}

class _TaskPickerItemState extends State<TaskPickerItem> {
  @override
  void initState() {
    super.initState();
    if (widget.isInitialActive) {
      setState(() {
        isCheckboxActive = true;
      });
    }
  }

  bool isCheckboxActive = false;

  void checkboxChange(bool val) {
    if (val) {
      widget.addTask(widget.taskId);
    } else {
      widget.removeTask(widget.taskId);
    }

    setState(() {
      isCheckboxActive = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var task =
        Provider.of<CategoryDataBlock>(context).taskProvider.getById(widget.taskId);
    return Row(
      children: [
        Text(task.value),
        Spacer(),
        Checkbox(value: isCheckboxActive, onChanged: checkboxChange)
      ],
    );
  }
}
