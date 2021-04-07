import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryDataBlock extends ChangeNotifier {
  final CategoryProvider categoryProvider;
  final SubcategoryProvider subcategoryProvider;
  final TaskProvider taskProvider;

  List<Category> _categories;
  List<Subcategory> _subcategories;
  List<Task> _tasks;

  CategoryDataBlock(
      this.categoryProvider, this.subcategoryProvider, this.taskProvider) {
    _categories = categoryProvider.items;
    _subcategories = subcategoryProvider.items;
    _tasks = taskProvider.items;
  }

  Category getCategoryById(String categoryId) {
    return _categories.firstWhere((category) => category.id == categoryId);
  }

  List<Subcategory> getSubcategoriesByCategoryId(String categoryId) {
    return _subcategories
        .where((subcategory) => subcategory.categoryId == categoryId)
        .toList();
  }

  int getSubcategoryCount(String categoryId) {
    return _subcategories
        .where((subcategory) => subcategory.categoryId == categoryId)
        .length;
  }

  List<Task> getTasksBySubcategoryId(String subcategoryId) {
    return _tasks.where((task) => task.subcategoryId == subcategoryId).toList();
  }

  List<Task> getToDoTasksBySubcategoryId(String subcategoryId) {
    return _tasks
        .where((task) =>
            task.subcategoryId == subcategoryId &&
            task.status == TaskStatus.ToDo)
        .toList();
  }

  List<Task> getDoneTasksBySubcategoryId(String subcategoryId) {
    return _tasks
        .where((task) =>
            task.subcategoryId == subcategoryId &&
            task.status == TaskStatus.Done)
        .toList();
  }

  int getTasksCount(String categoryId) {
    var subcategoryIds = _subcategories
        .where((subcategory) => subcategory.categoryId == categoryId)
        .map((subcategory) => subcategory.id)
        .toList();

    return _tasks
        .where((task) => subcategoryIds.contains(task.subcategoryId))
        .length;
  }

  void deleteCategory(String categoryId) {
    categoryProvider.delete(categoryId);

    cascadeDeleteSubcategories(categoryId);
  }

  void deleteSubcategory(String subcategoryId, {bool notify = true}) {
    subcategoryProvider.delete(subcategoryId, notify);

    cascadeDeleteTask(subcategoryId);
  }

  void cascadeDeleteSubcategories(String categoryId) {
    var subcategoryIds =
        getSubcategoriesByCategoryId(categoryId).map((e) => e.id).toList();

    for (String subcategoryId in subcategoryIds) {
      deleteSubcategory(subcategoryId, notify: false);
    }

    subcategoryProvider.notifyListeners();
  }

  void deleteTask(String taskId, {bool notify = true}) {
    taskProvider.delete(taskId, notify);
  }

  void cascadeDeleteTask(String subcategoryId) {
    var taskIds =
        getTasksBySubcategoryId(subcategoryId).map((e) => e.id).toList();

    for (String taskId in taskIds) {
      deleteTask(taskId, notify: false);
    }

    taskProvider.notifyListeners();
  }
}
