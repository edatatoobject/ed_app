import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/widgets/main_screen/sprint/sprint_detail_screen/tasks/task_picker_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItemTP extends StatefulWidget {
  const CategoryItemTP(
      {Key key, this.categoryId, this.addTask, this.removeTask, this.activeTasks})
      : super(key: key);

  final Function(String taskId) addTask;
  final Function(String taskId) removeTask;

  final String categoryId;
  final List<String> activeTasks;

  @override
  _CategoryItemTPState createState() => _CategoryItemTPState();
}

class _CategoryItemTPState extends State<CategoryItemTP> {
  @override
  Widget build(BuildContext context) {
    var categoryDataBlock = Provider.of<CategoryDataBlock>(context);

    var category = categoryDataBlock.getCategoryById(widget.categoryId);

    var subcategories =
        categoryDataBlock.getSubcategoriesByCategoryId(widget.categoryId);

    return Container(
        child: Column(
      children: [
        Text(
          category.name,
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
        ...subcategories.map((subcategory) {
          var tasks = categoryDataBlock.getTasksBySubcategoryId(subcategory.id);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subcategory.name,
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Column(
                  children: tasks
                      .map((task) => TaskPickerItem(
                            taskId: task.id,
                            addTask: widget.addTask,
                            removeTask: widget.removeTask,
                            isInitialActive: widget.activeTasks == null ? false : widget.activeTasks.contains(task.id),
                          ))
                      .toList(),
                ),
              )
            ],
          );
        }).toList()
      ],
    ));
  }
}
