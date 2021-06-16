import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/sprint_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:ed_app/screens/bottom_tabs_screen.dart';
import 'package:ed_app/screens/category/category_text_screen.dart';
import 'package:ed_app/screens/category/category_detail_screen.dart';
import 'package:ed_app/theme/theme_data.dart';
import 'package:ed_app/widgets/category_screen/task/task_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
        ChangeNotifierProxyProvider<SprintProvider, SprintDataBlock>(
          create: (context) => SprintDataBlock(),
          update: (context, sprintProvider, sprintDataBlock) =>
              sprintDataBlock..update(sprintProvider),
        )
      ],
      child: MaterialApp(
        theme: CustomThemeData.themedata,
        home: BottomTabsScreen(),
        routes: {
          CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
          CategoryTextScreen.routeName: (ctx) => CategoryTextScreen(),
          TasksModal.routeName: (ctx) => TasksModal()
        },
      ),
    );
  }
}
