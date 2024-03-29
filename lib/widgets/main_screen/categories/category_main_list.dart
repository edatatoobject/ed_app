import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/dto/category_in_sprint_dto.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/widgets/main_screen/categories/category_main_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMainList extends StatefulWidget {
  const CategoryMainList({Key key}) : super(key: key);

  @override
  _CategoryMainListState createState() => _CategoryMainListState();
}

class _CategoryMainListState extends State<CategoryMainList> {
  List<CategoryInSprintDto> getCategoriesDto(BuildContext context, List<TaskInSprint> tasksInSprint) {


    var categoryDataBlock = Provider.of<CategoryDataBlock>(context);

    var tasks = categoryDataBlock
        .taskProvider.getByIds(tasksInSprint.map((e) => e.taskId).toList());

    var subcategories = categoryDataBlock
        .subcategoryProvider.getByIds(tasks.map((e) => e.subcategoryId).toList());

    var categories = categoryDataBlock.categoryProvider.getByIds(
        subcategories.map((e) => e.categoryId).toList());

    return categories.map((category) {
      var currentSubcategories = subcategories
          .where((subcategory) => subcategory.categoryId == category.id)
          .toList();
      var currentSubctegoriesIds =
          currentSubcategories.map((e) => e.id).toSet();

      var currentTasks = tasks
          .where((task) => currentSubctegoriesIds.contains(task.subcategoryId))
          .toList();

      var currentTasksIds = currentTasks.map((e) => e.id).toSet();

      var currentTasksInSprint = tasksInSprint
          .where((e) => currentTasksIds.contains(e.taskId))
          .toList();

      return CategoryInSprintDto(
          category: category,
          subcategories: currentSubcategories,
          tasks: currentTasks,
          tasksInSprint: currentTasksInSprint);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {

    var tasksInSprint = Provider.of<SprintDataBlock>(context)
        .getCurrentSprintTasks();

    var currentSprintCategories = getCategoriesDto(context, tasksInSprint);

    return Container(
      child: Column(
        children: currentSprintCategories
            .map((categoryDto) => CategoryMainItem(
                  categoryDto: categoryDto,
                ))
            .toList(),
      ),
    );
  }
}
