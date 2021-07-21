import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:flutter/material.dart';

class CategoryDataBlock extends ChangeNotifier {
  CategoryProvider categoryProvider;
  SubcategoryProvider subcategoryProvider;
  TaskProvider taskProvider;

  void update(CategoryProvider categoryProvider,
      SubcategoryProvider subcategoryProvider, TaskProvider taskProvider) {
    this.categoryProvider = categoryProvider;
    this.subcategoryProvider = subcategoryProvider;
    this.taskProvider = taskProvider;
  }

  // ----- Categories -----

  List<Category> getCategories() {
    return categoryProvider.getAll();
  }

  Category getCategoryById(String categoryId) {
    return categoryProvider.getById(categoryId);
  }

  List<Category> getCategoriesByIds(List<String> categoryIds) {
    return categoryProvider.getByIds(categoryIds);
  }

  // ----- Subcategories -----

  Subcategory getSubcategoryById(String subcategoryId) {
    return subcategoryProvider.getById(subcategoryId);
  }

  List<Subcategory> getSubcategoriesByIds(List<String> subcategoryIds) {
    return subcategoryProvider.getByIds(subcategoryIds);
  }

  List<Subcategory> getSubcategoriesByCategoryId(String categoryId) {
    return subcategoryProvider.getByCategoryId(categoryId);
  }

  int getSubcategoryCount(String categoryId) {
    return subcategoryProvider.getSubcategoryCount(categoryId);
  }

  // ----- Tasks -----

  Task getTaskById(String taskId) {
    return taskProvider.getById(taskId);
  }

  List<Task> getTasksByIds(List<String> taskIds) {
    return taskProvider.getByIds(taskIds);
  }

  List<Task> getTasksBySubcategoryId(String subcategoryId) {
    return taskProvider.getBySubcategoryId(subcategoryId);
  }

  List<Task> getToDoTasksBySubcategoryId(String subcategoryId) {
    return taskProvider.getToDoTasksBySubcategoryId(subcategoryId);
  }

  List<Task> getDoneTasksBySubcategoryId(String subcategoryId) {
    return taskProvider.getDoneTasksBySubcategoryId(subcategoryId);
  }

  int getTasksCount(String categoryId) {
    var subcategoryIds = subcategoryProvider
        .getByCategoryId(categoryId)
        .map((subcategory) => subcategory.id)
        .toList();

    return taskProvider.getCountByList(subcategoryIds);
  }

  // ----- Cascade deletion -----

  void deleteCategory(String categoryId) {
    categoryProvider.delete(categoryId);

    cascadeDeleteSubcategories(categoryId);
  }

  void deleteSubcategory(String subcategoryId, {bool notify = true}) {
    subcategoryProvider.delete(subcategoryId);

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
    taskProvider.delete(taskId);
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
