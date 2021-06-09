import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/widgets/category_screen/task/task_text_modal.dart';
import 'package:ed_app/widgets/category_screen/task/task_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'subcategory_text_modal.dart';

class SubcategoryItem extends StatefulWidget {
  final String name;
  final String id;
  final String categoryId;
  final Function(String) taskSheetCallFunction;

  const SubcategoryItem(
      {Key key,
      @required this.name,
      @required this.id,
      @required this.categoryId,
      this.taskSheetCallFunction})
      : super(key: key);

  @override
  _SubcategoryItemState createState() => _SubcategoryItemState();
}

class _SubcategoryItemState extends State<SubcategoryItem> {
  void startCreateNewTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return TaskTextModal(
              categoryId: widget.categoryId,
              subcategoryId: widget.id,
              actionType: ActionType.Create);
        });
  }

  void openTasksModal(BuildContext context) {
    widget.taskSheetCallFunction(widget.id);
  }

  void editSubcategory() {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return SubcategoryTextModal(
              subcategoryId: widget.id,
              actionType: ActionType.Edit,
              name: widget.name);
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
          value: () => block.deleteSubcategory(widget.id),
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    return GestureDetector(
      onTap: () => openTasksModal(context),
      child: Card(
        margin: EdgeInsets.all(10),
        child: InkWell(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startCreateNewTask(context),
              ),
              Text(widget.name,
                  style: Theme.of(context).primaryTextTheme.bodyText2),
              const SizedBox(width: 20),
              Text(
                  "ToDo: ${dataBloc.getToDoTasksBySubcategoryId(widget.id).length}",
                  style: Theme.of(context).primaryTextTheme.subtitle2),
              const SizedBox(width: 10),
              Text(
                  "Done: ${dataBloc.getDoneTasksBySubcategoryId(widget.id).length}",
                  style: Theme.of(context).primaryTextTheme.subtitle2),
              Spacer(),
              PopupMenuButton(
                  onSelected: (value) => value(),
                  itemBuilder: (context) => popupMenu(dataBloc)),
            ],
          ),
        ),
      ),
    );
  }
}
