import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/widgets/category_screen/task/task_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksModal extends StatefulWidget {
  final String categoryId;
  final String subcategoryId;

  const TasksModal({Key key, this.subcategoryId, this.categoryId})
      : super(key: key);

  @override
  _TasksModalState createState() => _TasksModalState();
}

class _TasksModalState extends State<TasksModal> {
  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    var tasks = dataBloc.getTasksBySubcategoryId(widget.subcategoryId);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        ...tasks
            .map((task) => TaskListItem(
                taskId: task.id,
                categroryId: widget.categoryId,
                subcategoryId: widget.subcategoryId,
                value: task.value,
                status: task.status))
            .toList()
      ]),
    );
  }
}
