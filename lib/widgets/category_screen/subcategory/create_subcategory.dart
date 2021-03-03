import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubcategoryTextModal extends StatelessWidget {
  final String categoryId;
  final String subcategoryId;
  final ActionType actionType;
  final String name;

  SubcategoryTextModal(
      {Key key,
      @required this.actionType,
      this.categoryId,
      this.subcategoryId,
      this.name})
      : super(key: key){
        if(name != null){
          controller.text = name;
        }
      }

  final controller = TextEditingController();

  void saveSubcategory(BuildContext context) {
    switch (actionType) {
      case ActionType.Create:
        Provider.of<CategoryDataBlock>(context, listen: false)
            .addSubcategory(controller.text, categoryId);
        break;
      case ActionType.Edit:
        Provider.of<CategoryDataBlock>(context, listen: false)
            .editSubcategory(subcategoryId, controller.text);
        break;
    }

    Provider.of<CategoryDataBlock>(context, listen: false)
        .addSubcategory(controller.text, categoryId);

    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "CategoryName"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              child: Text("Save"), onPressed: () => saveSubcategory(context))
        ],
      ),
    );
  }
}
