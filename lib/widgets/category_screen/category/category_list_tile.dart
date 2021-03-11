import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/screens/category/category_text_screen.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListTile extends StatelessWidget {
  final IconInfo iconInfo;
  final String id;
  final String name;
  final int subcategoryCount;
  final int taskCount;

  CategoryListTile(
      {Key key,
      @required this.id,
      @required this.iconInfo,
      @required this.name,
      @required this.subcategoryCount,
      @required this.taskCount})
      : super(key: key);

  List<PopupMenuEntry<Function>> popupMenu(BuildContext context) {
    var block = Provider.of<CategoryDataBlock>(context, listen: false);
    return [
      PopupMenuItem(
          value: () => Navigator.of(context).pushNamed(CategoryTextScreen.routeName, arguments: id),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
          )),
      const PopupMenuDivider(),
      PopupMenuItem(
          value: () => block.deleteCategory(id),
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
          )),
    ];
  }

  editCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryTextScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CodeIcon(code: iconInfo.code, fontFamily: iconInfo.fontFamily),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  "Subcategories: $subcategoryCount",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Tasks: $taskCount",
                    style: TextStyle(color: Colors.blueGrey)),
              ],
            )
          ],
        ),
        Spacer(),
        PopupMenuButton(
            onSelected: (value) => value(),
            itemBuilder: (context) => popupMenu(context)),
      ],
    );
  }
}
