import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/tools/focus_scope_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class TaskTextModal extends StatefulWidget {
  final String taskId;
  final String categoryId;
  final String subcategoryId;
  final ActionType actionType;
  final String name;

  TaskTextModal(
      {Key key,
      @required this.categoryId,
      this.taskId,
      this.subcategoryId,
      this.name,
      this.actionType})
      : super(key: key) {}

  @override
  _TaskTextModalState createState() => _TaskTextModalState();
}

class _TaskTextModalState extends State<TaskTextModal> {
  String pickedSubcategoryId;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pickedSubcategoryId = widget.subcategoryId;
    if (widget.name != null && widget.name.isNotEmpty) {
      controller.text = widget.name;
    }
  }

  void changeSubcategory(String newValue) {
    setState(() {
      pickedSubcategoryId = newValue;
    });
  }

  List<DropdownMenuItem<String>> getDropdownMenuItems(
      List<Subcategory> subcategories) {
    return subcategories
        .map((s) => DropdownMenuItem<String>(value: s.id, child: Text(s.name)))
        .toList();
  }

  void saveTask() {
    DismissFocusScope(context);

    EasyLoading.show(status: 'loading...');

    var task = Task(value: controller.text, subcategoryId: pickedSubcategoryId);

    if (widget.actionType == ActionType.Create) {
      Provider.of<CategoryDataBlock>(context, listen: false)
          .taskProvider
          .add(task);
    } else {
      Provider.of<CategoryDataBlock>(context, listen: false)
          .taskProvider
          .update(widget.taskId, task);
    }

    EasyLoading.dismiss();

    Navigator.of(context).pop();
  }

  void deleteTask() {
    Provider.of<CategoryDataBlock>(context, listen: false)
        .deleteTask(widget.taskId);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var subcategories = Provider.of<CategoryDataBlock>(context, listen: false)
        .getSubcategoriesByCategoryId(widget.categoryId);

    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text(widget.actionType == ActionType.Create ? "Create" : "Edit",
              style: Theme.of(context).primaryTextTheme.bodyText1),
          DropdownButton<String>(
              value: pickedSubcategoryId == null
                  ? subcategories.first.id
                  : pickedSubcategoryId,
              items: getDropdownMenuItems(subcategories),
              onChanged: changeSubcategory),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Task Name"),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(child: Text("Save"), onPressed: saveTask),
          widget.actionType == ActionType.Edit
              ? ElevatedButton(child: Text("Delete"), onPressed: deleteTask)
              : SizedBox()
        ],
      ),
    );
  }
}
