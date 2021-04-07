import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/task.dart';
import 'package:flutter/cupertino.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _items = DummyData.dummyTasks;

  List<Task> get items => [..._items];

  void add(String name, String subcategoryId, TaskStatus taskStatus,
      {String description}) {
    var task = Task(
        id: DateTime.now().toString(),
        subcategoryId: subcategoryId,
        value: name,
        status: taskStatus,
        description: description);

    _items.add(task);
    notifyListeners();
  }

  void edit(String taskId, String name, String subcategoryId) {
    var index = _findIndex(taskId);

    var task = _items[index];

    var newTask =
        Task(value: name, subcategoryId: subcategoryId, status: task.status);

    _items[index] = newTask;

    notifyListeners();
  }

  void delete(String taskId, bool notify) {
    var index = _findIndex(taskId);

    _items.removeAt(index);

    if (notify) {
      notifyListeners();
    }
  }

  int _findIndex(String taskId) {
    return _items.indexWhere((element) => element.id == taskId);
  }
}
