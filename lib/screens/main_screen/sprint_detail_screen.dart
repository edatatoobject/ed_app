import 'package:ed_app/tools/dateTimeTool.dart';
import 'package:ed_app/widgets/main_screen/sprint/sprint_detail_screen/sprint_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/icons.dart';
import 'package:intl/intl.dart';

class SprintDetailScreen extends StatefulWidget {
  static const String routeName = "/sprint-detail";

  SprintDetailScreen({Key key}) : super(key: key);

  @override
  _SprintDetailScreenState createState() => _SprintDetailScreenState();
}

class _SprintDetailScreenState extends State<SprintDetailScreen> {
  String emptyFieldValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var sprintId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              sprintId == null ? "New Sprint" : "Editing Sprint",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            SizedBox(height: 40),
            SprintForm()
          ],
        ),
      ),
    ));
  }
}
