import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryDataBlock extends ChangeNotifier {
  final CategoryProvider _categoryProvider;
  final SubcategoryProvider _subcategoryProvider;
  final TaskProvider _taskProvider;

  CategoryDataBlock(
      this._categoryProvider, this._subcategoryProvider, this._taskProvider);

  List<Subcategory> getSubcategoriesByCategoryId(String categoryId) {
    return _subcategoryProvider.items
        .where((subcategory) => subcategory.categoryId == categoryId)
        .toList();
  }

  int getSubcategoryCount(String categoryId) {
    return _subcategoryProvider.items
        .where((subcategory) => subcategory.categoryId == categoryId)
        .length;
  }

  int getTasksCount(String categoryId) {
    var subcategoryIds = _subcategoryProvider.items
        .where((subcategory) => subcategory.categoryId == categoryId)
        .map((subcategory) => subcategory.id)
        .toList();

    return _taskProvider.items
        .where((task) => subcategoryIds.contains(task.subcategoryId))
        .length;
  }
}
