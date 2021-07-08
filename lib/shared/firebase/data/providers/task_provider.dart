import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final collectionName = "tasks";
  final firestoreManager = FirestoreManager();

  //get all
  Future<List<Task>> getAll() async {
    var taskData = await firestoreManager.getAll(collectionName);

    var tasks = _mapTaskList(taskData);

    return tasks;
  }

  //get by id
  Future<Task> getById(String taskId) async {
    var taskData = await firestoreManager.getById(collectionName, taskId);

    var task = Task.fromMap(taskData.id, taskData.data());

    return task;
  }

  //get range by list ids
  Future<List<Task>> getByIds(List<String> taskIds) async {
    var tasksData = await firestoreManager.getByIds(collectionName, taskIds);

    var tasks = _mapTaskList(tasksData);

    return tasks;
  }

  Future<List<Task>> getBySubcategoryId(String subcategoryId) async {
    var tasksData = await firestoreManager.getByEqualFilter(
        collectionName, "subcategoryId", subcategoryId);

    var tasks = _mapTaskList(tasksData);

    return tasks;
  }

  Future<List<Task>> getToDoTasksBySubcategoryId(String subcategoryId) async {
    var tasks = await getBySubcategoryId(subcategoryId);

    return tasks.where((task) => task.status == TaskStatus.ToDo);
  }

  Future<List<Task>> getDoneTasksBySubcategoryId(String subcategoryId) async {
    var tasks = await getBySubcategoryId(subcategoryId);

    return tasks.where((task) => task.status == TaskStatus.Done);
  }

  //add
  Future add(Task task) async {
    await firestoreManager.add(collectionName, task.toMap());

    notifyListeners();
  }

  //update
  Future update(Task task) async {
    await firestoreManager.update(collectionName, task.id, task.toMap());

    notifyListeners();
  }

  //delete
  Future delete(String id) async {
    await firestoreManager.delete(collectionName, id);

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
