import 'package:ed_app/database/blocs/categoryBlock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';

class StreamCategory extends StatefulWidget {
  @override
  _StreamCategoryState createState() => _StreamCategoryState();
}

class _StreamCategoryState extends State<StreamCategory> {
  @override
  Widget build(BuildContext context) {
    return _buildCategoryList(context);
  }

  StreamBuilder<List<CategoryData>> _buildCategoryList(BuildContext context) {
    final dataBlock = Provider.of<CategoryBlock>(context);
    return StreamBuilder(
      stream: dataBlock.getCategoriesStream(),
      builder: (context, AsyncSnapshot<List<CategoryData>> snapshot) {
        final categories = snapshot.data ?? List();
        return ListView(
          children: categories.map((category) => _buildListItem(category, dataBlock)).toList()
        );
      },
    );
  }

  Widget _buildListItem(CategoryData category, CategoryBlock databLock) {
    return ListTile(
      title: Text(category.name),
      subtitle: _buildSubcategoryList(context, category.id, databLock),
    );
  }

  StreamBuilder<List<SubcategoryData>> _buildSubcategoryList(
      BuildContext context, int categoryId, CategoryBlock dataBlock) {
    return StreamBuilder(
        stream: dataBlock.getSubcategoriesStream(categoryId),
        builder: (context, AsyncSnapshot<List<SubcategoryData>> snapshot) {
          final subcategories = snapshot.data ?? List();
          return ListView(
            children: subcategories.map((subcategory) {
              return _buildSubcategoryListItem(subcategory);
            }).toList(),
          );
        });
  }

  Widget _buildSubcategoryListItem(SubcategoryData subcategory) {
    return ListTile(title: Text(subcategory.name));
  }
}
