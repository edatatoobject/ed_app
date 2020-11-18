import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:ed_app/screens/bottom_tabs_screen.dart';
import 'package:ed_app/screens/category/category_detail_screen.dart';
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
          update: (context, category, subcategory, task, previous) =>
              CategoryDataBlock(category.items, subcategory.items, task.items),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.orange, accentColor: Colors.orangeAccent,
            ),
        home: BottomTabsScreen(),
        routes: {
          CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen()
        },
      ),
    );
  }
}
