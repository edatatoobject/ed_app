import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/enums/task_status.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryDataBlock extends ChangeNotifier {
  final CategoryProvider _categoryProvider;
  final SubcategoryProvider _subcategoryProvider;
  final TaskProvider _taskProvider;

  List<Category> _categories;
  List<Subcategory> _subcategories;
  List<Task> _tasks;

  CategoryDataBlock(
      this._categoryProvider, this._subcategoryProvider, this._taskProvider) {
    _categories = _categoryProvider.items;
    _subcategories = _subcategoryProvider.items;
    _tasks = _taskProvider.items;
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

  void addCategory(String name, CategorySize size, IconData iconData) {
    var iconInfo = IconInfo(iconData.codePoint, iconData.fontFamily);

    var category = Category(
        id: DateTime.now().toString(),
        name: name,
        categorySize: size,
        iconInfo: iconInfo);
    _categoryProvider.addCategory(category);
  }

  void editCategory(String categoryId, String name, CategorySize categorySize,
      IconData iconData) {
    _categoryProvider.editCategory(categoryId, name, categorySize, iconData);
  }

  void deleteCategory(String categoryId) {
    _categoryProvider.deleteCategory(categoryId);
  }

  void addTask(String name, String subcategoryId, TaskStatus taskStatus,
      {String description}) {
    var task = Task(
        id: DateTime.now().toString(),
        subcategoryId: subcategoryId,
        value: name,
        status: taskStatus,
        description: description);

    _taskProvider.addTask(task);
  }

  void editTask(String taskId, String name, String subcategoryId,
      {String description}) {
    _taskProvider.editTask(
        taskId: taskId,
        name: name,
        subcategoryId: subcategoryId,
        description: description);
  }

  void deleteTask(String taskId) {
    _taskProvider.deleteTask(taskId);
  }

  void addSubcategory(String name, String categoryId) {
    var subcategory = Subcategory(
        id: DateTime.now().toString(), categoryId: categoryId, name: name);
    _subcategoryProvider.add(subcategory);
  }

  void editSubcategory(String subcategoryId, String name) {
    _subcategoryProvider.edit(subcategoryId, name);
  }

  void deleteSubcategory(String subcategoryId) {
    _subcategoryProvider.delete(subcategoryId);
  }
}
