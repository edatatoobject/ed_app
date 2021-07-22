import 'package:ed_app/screens/bottom_tabs_screen.dart';
import 'package:ed_app/screens/loading_screen.dart';
import 'package:ed_app/shared/firebase/data/firebase_data_initializer.dart';
import 'package:flutter/material.dart';

class InitializingScreen extends StatefulWidget {
  const InitializingScreen({Key key}) : super(key: key);

  @override
  _InitializingScreenState createState() => _InitializingScreenState();
}

class _InitializingScreenState extends State<InitializingScreen> {
  bool initialized = false;

  void initData(BuildContext context) async {
    if (!initialized) {
      await FirebaseDataInitializer.initData(context);
    }

    setState(() {
      initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return initialized ? BottomTabsScreen() : LoadingScreen();
  }
}
