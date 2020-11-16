import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ? pub command flutter packages pub run build_runner watch --delete-conflicting-outputs

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("ok, boomer"));
  }
}
