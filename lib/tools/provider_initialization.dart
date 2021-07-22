import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/sprint_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_in_sprint_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> initializeProviders() {
  return [
    //categories providers
    ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SubcategoryProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
    ),
    ChangeNotifierProxyProvider3<CategoryProvider, SubcategoryProvider,
        TaskProvider, CategoryDataBlock>(
      create: (context) => CategoryDataBlock(),
      update: (context, category, subcategory, task, previous) =>
          previous..update(category, subcategory, task),
    ),

    //sprint provider
    ChangeNotifierProvider(
      create: (context) => SprintProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TaskInSprintProvider(),
    ),
    ChangeNotifierProxyProvider2<SprintProvider, TaskInSprintProvider,
        SprintDataBlock>(
      create: (context) => SprintDataBlock(),
      update:
          (context, sprintProvider, taskInSprintProvider, sprintDataBlock) =>
              sprintDataBlock..update(sprintProvider, taskInSprintProvider),
    )
  ];
}
