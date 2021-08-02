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

    notifyListeners();
  }

  int getTasksCount(String categoryId) {
    var subcategoryIds = subcategoryProvider
        .getByCategoryId(categoryId)
        .map((subcategory) => subcategory.id)
        .toList();

    return taskProvider.getCountByList(subcategoryIds);
  }
}
