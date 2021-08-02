import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final collectionName = "tasks";
  final firestoreManager = FirestoreManager();

  List<Task> _items = [];

  Future initData() async {
    var data = await firestoreManager.getAll(collectionName);
    _items = _mapTaskList(data);
  }

  //get all
  List<Task> getAll() {
    return [..._items];
  }

  //get by id
  Task getById(String taskId) {
    return _items.firstWhere((task) => task.id == taskId);
  }

  //get range by list ids
  List<Task> getByIds(List<String> taskIds) {
    return _items.where((task) => taskIds.contains(task.id)).toList();
  }

  List<Task> getBySubcategoryId(String subcategoryId) {
    print("stop blyat");
    return _items.where((task) => task.subcategoryId == subcategoryId).toList();
  }

  List<Task> getToDoTasksBySubcategoryId(String subcategoryId) {
    var tasks = getBySubcategoryId(subcategoryId);

    return tasks.where((task) => task.status == TaskStatus.ToDo).toList();
  }

  List<Task> getDoneTasksBySubcategoryId(String subcategoryId) {
    var tasks = getBySubcategoryId(subcategoryId);

    return tasks.where((task) => task.status == TaskStatus.Done).toList();
  }

  int getCountByList(List<String> subcategoryIds) {
    return _items
        .where((task) => subcategoryIds.contains(task.subcategoryId))
        .length;
  }

  Future changeStatus(String id, TaskStatus status) async {
    await firestoreManager
        .update(collectionName, id, {"status": getStatusIndex(status)});

    var taskIndex = _items.indexWhere((task) => id == task.id);

    var task = _items[taskIndex];

    var newTask = Task(
        id: task.id,
        subcategoryId: task.subcategoryId,
        value: task.value,
        status: status,
        description: task.description);

    _items[taskIndex] = newTask;

    notifyListeners();
  }

  //add
  Future add(Task task) async {
    var id = await firestoreManager.add(collectionName, task.toMap());

    var newTask = Task.fromTask(id, task);

    _items.add(newTask);

    notifyListeners();
  }

  //update
  Future update(String id, Task task) async {
    await firestoreManager.update(collectionName, task.id, task.toMap());

    var taskIndex = _items.indexWhere((task) => id == task.id);

    var newTask = Task.fromTask(id, task);

    _items[taskIndex] = newTask;

    notifyListeners();
  }

  //delete
  Future delete(String id) async {
    await firestoreManager.delete(collectionName, id);

    var taskIndex = _items.indexWhere((task) => id == task.id);

    _items.removeAt(taskIndex);

    notifyListeners();
  }

  List<Task> _mapTaskList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot
        .map((categoryData) =>
            Task.fromMap(categoryData.id, categoryData.data()))
        .toList();
  }
}
