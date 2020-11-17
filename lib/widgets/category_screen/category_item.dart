import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/screens/category/category_detail_screen.dart';
import 'package:ed_app/widgets/category_screen/category_expanded_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_list_tile.dart';

class CategoryItem extends StatefulWidget {
  final String id;
  final String name;
  final IconInfo iconInfo;

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
  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    return Card(
        margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            print("tapetOnCategory");
            Navigator.of(context).pushNamed(CategoryDetailScreen.routeName,
                arguments: widget.id);
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
            ]),
          ),
        ));
    ;
  }
}
