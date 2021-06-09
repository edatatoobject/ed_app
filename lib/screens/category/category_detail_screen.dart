import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/ui_elements/code_icon.dart';
import 'package:ed_app/widgets/category_screen/subcategory/subcategory_text_modal.dart';
import 'package:ed_app/widgets/category_screen/subcategory/subcategory_item.dart';
import 'package:ed_app/widgets/category_screen/task/task_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const String routeName = "/category-detail";

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  void createSubcategory(BuildContext context, String categoryId) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return SubcategoryTextModal(
            categoryId: categoryId,
            actionType: ActionType.Create,
          );
        });
  }

  bool taskSheetIsOpen = false;
  bool rebuildModalSheet = false;

  String taskModalSubcategoryId;

  void openTaskSheet(String subcategoryId) {
    setState(() {
      rebuildModalSheet = true;
      taskModalSubcategoryId = subcategoryId;
      taskSheetIsOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var categoryId = ModalRoute.of(context).settings.arguments as String;

    var dataBloc = Provider.of<CategoryDataBlock>(context);
    var category = dataBloc.getCategoryById(categoryId);
    var subcategories = dataBloc.getSubcategoriesByCategoryId(categoryId);

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: MediaQuery.of(context).viewPadding.top + 20,
              bottom: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CodeIcon(
                code: category.iconInfo.code,
                fontFamily: category.iconInfo.fontFamily,
                size: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                category.name,
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    return SubcategoryItem(
                      name: subcategories[index].name,
                      id: subcategories[index].id,
                      categoryId: categoryId,
                      taskSheetCallFunction: openTaskSheet,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: BackButton()),
        taskSheetIsOpen
            ? TasksModal(
                key: UniqueKey(),
                categoryId: categoryId,
                subcategoryId: taskModalSubcategoryId,
                rebuildTaskModal: rebuildModalSheet,
              )
            : SizedBox(
                width: 0,
              )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => createSubcategory(context, categoryId),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
