import 'package:ed_app/dto/category_in_sprint_dto.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/theme/custom_theme_data.dart';
import 'package:ed_app/widgets/main_screen/categories/category_main_tile.dart';
import 'package:ed_app/widgets/main_screen/category_detail_modal/category_main_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CategoryMainItem extends StatelessWidget {
  final CategoryInSprintDto categoryDto;

  const CategoryMainItem({Key key, this.categoryDto}) : super(key: key);

  int getDoneTasksAmount(List<TaskInSprint> taskInSprint) {
    return taskInSprint
        .where((task) => task.status == TaskInSprintStatus.Done)
        .length;
  }

  void openTasksWindow(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return CategoryMainDetailModal(categoryDto: categoryDto);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            margin: EdgeInsets.zero,
            child: InkWell(
                onTap: () => openTasksWindow(context),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CategoryMainTile(
                    categoryDto: categoryDto,
                  ),
                )),
          ),
          StepProgressIndicator(
            padding: 2,
            totalSteps: categoryDto.tasksInSprint.length,
            currentStep: getDoneTasksAmount(categoryDto.tasksInSprint),
            selectedColor: Colors.green,
            unselectedColor: CustomThemeData.subForegroundColor,
          )
        ],
      ),
    );
  }
}
