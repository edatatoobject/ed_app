import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  final IconInfo iconInfo;

  const CategoryItem(
      {Key key,
      @required this.id,
      @required this.name,
      @required this.iconInfo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: CodeIcon(
              code: iconInfo.code,
              fontFamily: iconInfo.fontFamily,
            ),
            title: Text(name),
          )
        ],
      ),
    );
  }
}
