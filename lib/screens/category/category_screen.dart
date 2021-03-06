import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/screens/category/category_text_screen.dart';
import 'package:ed_app/theme/custom_theme_data.dart';
import 'package:ed_app/widgets/category_screen/category/category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Categories",
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.add, color: CustomThemeData.accentColor,),
                onPressed: () {
                  Navigator.of(context).pushNamed(CategoryTextScreen.routeName);
                },
              )
            ],
          ),
          Expanded(
            child: Consumer<CategoryProvider>(
              builder: (context, category, child) {
                return ListView.builder(
                  itemCount: category.items.length,
                  itemBuilder: (context, index) {
                    return CategoryListItem(
                      id: category.items[index].id,
                      name: category.items[index].name,
                      iconInfo: category.items[index].iconInfo,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
