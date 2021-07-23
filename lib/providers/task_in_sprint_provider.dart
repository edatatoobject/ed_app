import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class TaskInSprintProvider extends ChangeNotifier {
  final collectionName = "taskInSprint";
  final firestoreManager = FirestoreManager();

  List<TaskInSprint> _items = [];

  Future initData() async {
    var data = await firestoreManager.getAll(collectionName);
    _items = _mapTaskInSprintList(data);
  }

  TaskInSprint getById(String id) {
    return _items.firstWhere((taskInSprint) => taskInSprint.id == id);
  }

  List<TaskInSprint> getBySprintId(String sprintId) {
    return _items
        .where((taskInSprint) => taskInSprint.sprintId == sprintId)
        .toList();
  }

  Future update(String id, TaskInSprint taskInSprint) async {
    await firestoreManager.update(collectionName, id, taskInSprint.toMap());

    var taskInSprintIndex = _items.indexWhere((category) => id == category.id);

    var newTaskInSprin = TaskInSprint.fromTaskInSprint(id, taskInSprint);

    _items[taskInSprintIndex] = newTaskInSprin;

    notifyListeners();
  }

  Future add(TaskInSprint taskInSprint) async {
    var id = await firestoreManager.add(collectionName, taskInSprint.toMap());

    var newTaskInSprint = TaskInSprint.fromTaskInSprint(id, taskInSprint);

    _items.add(newTaskInSprint);
  }

  Future delete(String id) async {
    await firestoreManager.delete(collectionName, id);

    var taskInSprintIndex =
        _items.indexWhere((taskInSprint) => id == taskInSprint.id);

    _items.removeAt(taskInSprintIndex);
  }

  Future removeRange(List<String> idList) async {
    for (var id in idList) {
      await delete(id);
    }

    notifyListeners();
  }

  Future updateTasksInSprint(
      List<TaskInSprint> newTasks, List<String> deleteTaskIds) async {
    for (var taskId in deleteTaskIds) {
      await delete(taskId);
    }

    for (var newTaskInSprint in newTasks) {
      await add(newTaskInSprint);
    }

    notifyListeners();
  }

  List<TaskInSprint> _mapTaskInSprintList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot
        .map((categoryData) =>
            TaskInSprint.fromMap(categoryData.id, categoryData.data()))
        .toList();
  }
}
