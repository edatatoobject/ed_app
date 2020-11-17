import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryExpandedItem extends StatefulWidget {
  final String categoryId;

  const CategoryExpandedItem({Key key, this.categoryId}) : super(key: key);

  @override
  _CategoryExpandedItemState createState() => _CategoryExpandedItemState();
}

class _CategoryExpandedItemState extends State<CategoryExpandedItem> {
  @override
  Widget build(BuildContext context) {
    var subcategories = Provider.of<CategoryDataBlock>(context)
        .getSubcategoriesByCategoryId(widget.categoryId);
    return Column(
      children: [...subcategories.map((e) => Text(e.name)).toList()],
    );
  }
}
