import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:ed_app/widgets/category_screen/subcategory_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const String routeName = "/category-detail";

  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    var categoryId = ModalRoute.of(context).settings.arguments as String;
    var category = dataBloc.getCategoryById(categoryId);
    var subcategories = dataBloc.getSubcategoriesByCategoryId(categoryId);

    return Scaffold(
      body: Stack(
              children:[ Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: MediaQuery.of(context).viewPadding.top + 20, bottom: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CodeIcon(
                code: category.iconInfo.code,
                fontFamily: category.iconInfo.fontFamily,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                category.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    return SubcategoryItem(
                        name: subcategories[index].name,
                        id: subcategories[index].id);
                  },
                ),
              )
            ],
          ),
        ),
        Container(padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top), child: BackButton())]
      ),
    );
  }
}
