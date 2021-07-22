import 'package:ed_app/screens/auth/auth_screen.dart';
import 'package:ed_app/screens/category/category_text_screen.dart';
import 'package:ed_app/screens/category/category_detail_screen.dart';
import 'package:ed_app/screens/initializing_screen.dart';
import 'package:ed_app/screens/main_screen/sprint_detail_screen.dart';
import 'package:ed_app/screens/main_screen/tasks_picker_screen.dart';
import 'package:ed_app/theme/custom_theme_data.dart';
import 'package:ed_app/theme/setup_easy_loading.dart';
import 'package:ed_app/tools/provider_initialization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupEasyLoading();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: initializeProviders(),
      child: MaterialApp(
        theme: CustomThemeData.themedata,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InitializingScreen();
              }
              return AuthScreen();
            }),
        builder: EasyLoading.init(),
        routes: {
          CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
          CategoryTextScreen.routeName: (ctx) => CategoryTextScreen(),
          SprintDetailScreen.routeName: (ctx) => SprintDetailScreen(),
          TasksPickerScreen.routeName: (ctx) => TasksPickerScreen()
        },
      ),
    );
  }
}
