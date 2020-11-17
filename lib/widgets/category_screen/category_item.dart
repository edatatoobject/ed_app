import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/providers/subcategory_provider.dart';
import 'package:ed_app/providers/task_provider.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:ed_app/widgets/category_screen/category_expanded_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_list_tile.dart';

class CategoryItem extends StatefulWidget {
  final String id;
  final String name;
  final IconInfo iconInfo;

  bool _expanded = false;

  CategoryItem(
      {Key key,
      @required this.id,
      @required this.name,
      @required this.iconInfo})
      : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDataBlock>(
      builder: (context, dataBloc, child) {
        return Card(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                print("tapetOnCategory");
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  CategoryListTile(
                    iconInfo: widget.iconInfo,
                    name: widget.name,
                    subcategoryCount: dataBloc.getSubcategoryCount(widget.id),
                    taskCount: dataBloc.getTasksCount(widget.id),
                  ),
                  if (_expanded)
                    CategoryExpandedItem(
                      categoryId: widget.id,
                    )
                ]),
              ),
            ));
      },
    );
  }
}