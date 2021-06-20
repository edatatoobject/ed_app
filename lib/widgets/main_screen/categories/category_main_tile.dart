import 'package:ed_app/dto/category_in_sprint_dto.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:flutter/material.dart';

class CategoryMainTile extends StatelessWidget {
  final CategoryInSprintDto categoryDto;

  const CategoryMainTile({Key key, this.categoryDto}) : super(key: key);

  double calculateProgress(List<TaskInSprint> tasksInSprint) {
    return (tasksInSprint
                .where((task) => task.status == TaskInSprintStatus.Done)
                .length /
            tasksInSprint.length) *
        100;
  }

  int getTodoTasksAmount(List<TaskInSprint> tasksInSprint) {
    return tasksInSprint
        .where((task) => task.status == TaskInSprintStatus.Current)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CodeIcon(
            code: categoryDto.category.iconInfo.code,
            fontFamily: categoryDto.category.iconInfo.fontFamily),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryDto.category.name,
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            Row(
              children: [
                Text(
                  "Progress: ${calculateProgress(categoryDto.tasksInSprint).toStringAsFixed(0)}%",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
                SizedBox(
                  width: 20,
                ),
                Text("TODO: ${getTodoTasksAmount(categoryDto.tasksInSprint)}",
                    style: Theme.of(context).primaryTextTheme.subtitle2),
              ],
            )
          ],
        ),
      ],
    );
  }
}
