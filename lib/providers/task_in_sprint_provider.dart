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

  Future add(TaskInSprint taskInSprint) async {
    await firestoreManager.add(collectionName, taskInSprint.toMap());

    notifyListeners();
  }

  Future update(String taskId, TaskInSprint taskInSprint) async {
    await firestoreManager.update(collectionName, taskId, taskInSprint.toMap());

    notifyListeners();
  }

  Future removeRange(List<String> taskIds) async {
    for (var taskId in taskIds) {
      await firestoreManager.delete(collectionName, taskId);
    }

    notifyListeners();
  }

  Future updateTasksInSprint(
      List<TaskInSprint> newTasks, List<String> deleteTaskIds) async {
    for (var deleteTaskId in deleteTaskIds) {
      await firestoreManager.delete(collectionName, deleteTaskId);
    }

    for (var newTask in newTasks) {
      await firestoreManager.add(collectionName, newTask.toMap());
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
