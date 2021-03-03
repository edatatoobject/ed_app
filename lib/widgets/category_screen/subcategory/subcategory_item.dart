import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/widgets/category_screen/task/create_task.dart';
import 'package:ed_app/widgets/category_screen/task/task_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_subcategory.dart';

class SubcategoryItem extends StatefulWidget {
  final String name;
  final String id;
  final String categoryId;

  const SubcategoryItem(
      {Key key,
      @required this.name,
      @required this.id,
      @required this.categoryId})
      : super(key: key);

  @override
  _SubcategoryItemState createState() => _SubcategoryItemState();
}

class _SubcategoryItemState extends State<SubcategoryItem> {
  bool _expanded = true;

  void expand() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  void startCreateNewTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return CreateTask(
            categoryId: widget.categoryId,
            subcategoryId: widget.id,
          );
        });
  }

  void editSubcategory() {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return SubcategoryTextModal(
            subcategoryId: widget.id,
            actionType: ActionType.Edit,
            name: widget.name
          );
        });
  }

  List<PopupMenuEntry<Function>> popupMenu(CategoryDataBlock block) {
    return [
      PopupMenuItem(
        value: () => editSubcategory(),
          child: ListTile(
        leading: const Icon(Icons.edit),
        title: const Text("Edit"),
      )),
      const PopupMenuDivider(),
      PopupMenuItem(
        value: () =>  block.deleteSubcategory(widget.id),
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
        )
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    var tasks = dataBloc.getTasksBySubcategoryId(widget.id);

    return Container(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => startCreateNewTask(context),
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 20),
                Text(
                    "ToDo: ${dataBloc.getToDoTasksBySubcategoryId(widget.id).length}"),
                SizedBox(width: 10),
                Text(
                    "Done: ${dataBloc.getDoneTasksBySubcategoryId(widget.id).length}"),
                Spacer(),
                PopupMenuButton(
                  onSelected: (value) => value(), 
                  itemBuilder: (context) => popupMenu(dataBloc)),
                GestureDetector(
                    child: Icon(_expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                    onTap: expand)
              ],
            ),
          ),
          Divider(
            height: 3,
          ),
          if (_expanded)
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 1, color: Colors.grey[200]))),
              padding: EdgeInsets.only(
                left: 5,
              ),
              child: Column(
                children: [
                  ...tasks
                      .map((task) =>
                          TaskListItem(value: task.value, status: task.status))
                      .toList()
                ],
              ),
            ),
        ],
      ),
    );
  }
}
