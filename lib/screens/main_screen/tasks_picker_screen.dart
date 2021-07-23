import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/widgets/main_screen/sprint/sprint_detail_screen/tasks/category_item_tasks_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksPickerScreen extends StatefulWidget {
  static const String routeName = "/tasks-picker";

  const TasksPickerScreen({Key key}) : super(key: key);

  @override
  _TasksPickerScreenState createState() => _TasksPickerScreenState();
}

class _TasksPickerScreenState extends State<TasksPickerScreen> {
  List<String> initialyActiveTasks = [];
  List<String> pickedTasks;

  void addTask(String taskId) {
    pickedTasks.add(taskId);
  }

  void removeTask(String taskId) {
    pickedTasks.remove(taskId);
  }

  void submit(BuildContext context) {
    Navigator.of(context).pop(pickedTasks);
  }

  Future<bool> _onPopScope(BuildContext context) async {
    Navigator.of(context).pop("cancel");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    initialyActiveTasks =
        ModalRoute.of(context).settings.arguments as List<String>;

    if (initialyActiveTasks != null) {
      pickedTasks = [...initialyActiveTasks];
    }

    var categories = Provider.of<CategoryDataBlock>(context).getCategories();

    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _onPopScope(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) => CategoryItemTP(
                      categoryId: categories[index].id,
                      addTask: addTask,
                      removeTask: removeTask,
                      activeTasks: initialyActiveTasks,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => submit(context), child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
