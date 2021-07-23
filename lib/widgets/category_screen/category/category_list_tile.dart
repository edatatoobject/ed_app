import 'package:ed_app/blocs/category_data_bloc.dart';
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

  CategoryListTile(
      {Key key,
      @required this.id,
      @required this.iconInfo,
      @required this.name,
      @required this.subcategoryCount})
      : super(key: key);

  List<PopupMenuEntry<Function>> popupMenu(BuildContext context) {
    return [
      PopupMenuItem(
          value: () => Navigator.of(context).pushNamed(CategoryTextScreen.routeName, arguments: id),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
          )),
      const PopupMenuDivider(),
      PopupMenuItem(
          value: () => Provider.of<CategoryDataBlock>(context, listen: false).categoryProvider.delete(id),
          child: ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
          )),
    ];
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
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            Row(
              children: [
                Text(
                  "Subcategories: $subcategoryCount",
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                ),
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
