import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTextModal extends StatefulWidget {
  final String taskId;
  final String categoryId;
  final String subcategoryId;
  final ActionType actionType;

  var controller = TextEditingController();

  TaskTextModal(
      {Key key,
      @required this.categoryId,
      this.taskId,
      this.subcategoryId,
      String name,
      this.actionType})
      : super(key: key) {
    if (name != null && name.isNotEmpty) {
      controller.text = name;
    }
  }

  @override
  _TaskTextModalState createState() => _TaskTextModalState();
}

class _TaskTextModalState extends State<TaskTextModal> {
  var pickedSubcategory;

  @override
  void initState() {
    super.initState();
    pickedSubcategory = widget.subcategoryId;
  }

  void changeSubcategory(String newValue) {
    setState(() {
      pickedSubcategory = newValue;
    });
  }

  List<DropdownMenuItem<String>> getDropdownMenuItems(
      List<Subcategory> subcategories) {
    return subcategories
        .map((s) => DropdownMenuItem<String>(value: s.id, child: Text(s.name)))
        .toList();
  }

  void saveTask() {
    if (widget.actionType == ActionType.Create) {
      Provider.of<CategoryDataBlock>(context, listen: false)
          .taskProvider.add(widget.controller.text, pickedSubcategory, TaskStatus.ToDo);
    } else {
      Provider.of<CategoryDataBlock>(context, listen: false)
          .taskProvider.edit(widget.taskId, widget.controller.text, pickedSubcategory);
    }

    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

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
          DropdownButton<String>(
              value: pickedSubcategory == null
                  ? subcategories.first.id
                  : pickedSubcategory,
              items: getDropdownMenuItems(subcategories),
              onChanged: changeSubcategory),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(hintText: "CategoryName"),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(child: Text("Save"), onPressed: saveTask)
        ],
      ),
    );
  }
}
