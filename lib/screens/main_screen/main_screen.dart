import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/widgets/main_screen/categories/category_main_list.dart';
import 'package:ed_app/widgets/main_screen/sprint/no_active_sprint_content.dart';
import 'package:ed_app/widgets/main_screen/sprint/sprint_headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool hasActiveSprint(BuildContext context) {
    return Provider.of<SprintDataBlock>(context).getCurrentSprint() != null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(
        children: [
          SprintHeadline(),
          hasActiveSprint(context) ? CategoryMainList() : NoActiveSprint()
        ],
      ),
    );
  }
}
