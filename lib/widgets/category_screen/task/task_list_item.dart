import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/ui_elements/task_status_indicator.dart';
import 'package:ed_app/widgets/category_screen/task/create_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatefulWidget {
  final String taskId;
  final String subcategoryId;
  final String categroryId;
  final String value;
  final TaskStatus status;

  const TaskListItem(
      {Key key,
      @required this.taskId,
      this.subcategoryId,
      @required this.categroryId,
      @required this.value,
      @required this.status})
      : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  showPopupMenu(BuildContext context) async {
    var block = Provider.of<CategoryDataBlock>(context, listen: false);
    dynamic selected = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(100, 400, 100, 400),
        items: popupMenu(block));

    if (selected != null) {
      selected();
    }
  }

  List<PopupMenuEntry<dynamic>> popupMenu(CategoryDataBlock block) {
    return [
      PopupMenuItem(
          value: () => editTask(),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
          )),
      const PopupMenuDivider(),
      PopupMenuItem(
          value: () => block.deleteTask(widget.taskId),
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
          )),
    ];
  }

  void editTask() {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return TaskTextModal(
              categoryId: widget.categroryId,
              subcategoryId: widget.subcategoryId,
              actionType: ActionType.Edit,
              name: widget.value,
              taskId: widget.taskId);
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showPopupMenu(context),
      child: Row(
        children: [
          Text(widget.value),
          Spacer(),
          TaskStatusIndicator(
            taskStatus: widget.status,
          )
        ],
      ),
    );
  }
}
