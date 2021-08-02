import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/widgets/category_screen/task/task_list_item.dart';
import 'package:ed_app/widgets/category_screen/task/task_text_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksModal extends StatefulWidget {
  static String routeName = "TaskModalScreen";

  final String categoryId;
  final String subcategoryId;

  const TasksModal(
      {Key key, @required this.categoryId, @required this.subcategoryId})
      : super(key: key);

  @override
  _TasksModalState createState() => _TasksModalState();
}

class _TasksModalState extends State<TasksModal> {
  
  void startCreateNewTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return TaskTextModal(
              categoryId: widget.categoryId,
              subcategoryId: widget.subcategoryId,
              actionType: ActionType.Create);
        });
  }

  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    var subcategory =
        dataBloc.subcategoryProvider.getById(widget.subcategoryId);
    var tasks = dataBloc.taskProvider.getBySubcategoryId(widget.subcategoryId);
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Color.fromRGBO(225, 225, 225, 1))),
          color: Theme.of(context).backgroundColor),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Text(
            subcategory.name,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          IconButton(onPressed: () => startCreateNewTask(context), icon: Icon(Icons.add)),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListItem(
                      taskId: tasks[index].id,
                      categroryId: widget.categoryId,
                      subcategoryId: widget.subcategoryId,
                      value: tasks[index].value,
                      status: tasks[index].status);
                }),
          ),
        ],
      ),
    );
  }
}
