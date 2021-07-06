import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/providers/sprint_provider.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_in_sprint_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:ed_app/screens/bottom_tabs_screen.dart';
import 'package:ed_app/screens/category/category_text_screen.dart';
import 'package:ed_app/screens/category/category_detail_screen.dart';
import 'package:ed_app/screens/login/login_screen.dart';
import 'package:ed_app/screens/main_screen/sprint_detail_screen.dart';
import 'package:ed_app/screens/main_screen/tasks_picker_screen.dart';
import 'package:ed_app/theme/custom_theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        ChangeNotifierProvider(
          create: (context) => TaskInSprintProvider(),
        ),
        ChangeNotifierProxyProvider2<SprintProvider, TaskInSprintProvider, SprintDataBlock>(
          create: (context) => SprintDataBlock(),
          update: (context, sprintProvider, taskInSprintProvider, sprintDataBlock) =>
              sprintDataBlock..update(sprintProvider, taskInSprintProvider),
        )
      ],
      child: MaterialApp(
        theme: CustomThemeData.themedata,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomTabsScreen();
            }
            return LoginScreen();
          }),
        routes: {
          CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
          CategoryTextScreen.routeName: (ctx) => CategoryTextScreen(),
          SprintDetailScreen.routeName : (ctx) => SprintDetailScreen(),
          TasksPickerScreen.routeName : (ctx) => TasksPickerScreen()
        },
      ),
    );
  }
}
