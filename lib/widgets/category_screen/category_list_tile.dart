import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final IconInfo iconInfo;
  final String name;
  final int subcategoryCount;
  final int taskCount;

  CategoryListTile(
      {Key key,
      @required this.iconInfo,
      @required this.name,
      @required this.subcategoryCount,
      @required this.taskCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CodeIcon(code: iconInfo.code, fontFamily: iconInfo.fontFamily),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name),
            Row(
              children: [
                Text("Subcategories: $subcategoryCount"),
                SizedBox(
                  width: 20,
                ),
                Text("Tasks: $taskCount"),
              ],
            )
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            print("MoreButtonPressed");
          },
        )
      ],
    );
  }
}
