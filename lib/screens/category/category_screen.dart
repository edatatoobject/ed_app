import 'package:ed_app/providers/category_provider.dart';
import 'package:ed_app/widgets/category_screen/category_list_item.dart';
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
      child: Column( 
        children: [
          AppBar(
            title: Text("Categories", style: TextStyle(fontSize: 24)),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
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
