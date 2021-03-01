import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTask extends StatefulWidget {
  final String categoryId;
  final String subcategoryId;

  const CreateTask({Key key, @required this.categoryId, this.subcategoryId})
      : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  var controller = TextEditingController();
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
    Provider.of<CategoryDataBlock>(context, listen: false)
        .addTask(controller.text, pickedSubcategory, TaskStatus.ToDo);

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
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "CategoryName"),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(child: Text("Save"), onPressed: saveTask)
        ],
      ),
    );
  }
}
