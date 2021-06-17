import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/models/taskInSprint.dart';

class CategoryInSprintDto {
  final Category category;
  final List<Subcategory> subcategories;
  final List<Task> tasks;
  final List<TaskInSprint> tasksInSprint;

  CategoryInSprintDto({this.category, this.subcategories, this.tasks, this.tasksInSprint});
}
