import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/task.dart';
import 'package:flutter/cupertino.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _items = DummyData.dummyTasks;

  List<Task> get items => [..._items];

  void addTask(Task newTask) {
    _items.add(newTask);
    notifyListeners();
  }

  void editTask(
      {String taskId, String name, String subcategoryId, String description}) {
    var index = _items.indexWhere((element) => element.id == taskId);

    var task = _items[index];

    var newTask = Task(
        value: name,
        subcategoryId: subcategoryId,
        description: description,
        status: task.status);

    _items[index] = newTask;

    notifyListeners();
  }

  void deleteTask(String taskId) {
    var index = _items.indexWhere((element) => element.id == taskId);
    _items.removeAt(index);

    notifyListeners();
  }
}
