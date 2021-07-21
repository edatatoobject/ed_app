import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/tools/focus_scope_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
      : super(key: key) {
    if (name != null) {
      controller.text = name;
    }
  }

  final controller = TextEditingController();

  void saveSubcategory(BuildContext context) {
    FocusScopeTool().dismissFocusScope(context);

    EasyLoading.show(status: 'loading...');

    var subcategory =
        Subcategory(categoryId: categoryId, name: controller.text);

    if (actionType == ActionType.Create) {
      Provider.of<CategoryDataBlock>(context, listen: false)
          .subcategoryProvider
          .add(subcategory);
    } else {
      Provider.of<CategoryDataBlock>(context, listen: false)
          .subcategoryProvider
          .update(subcategoryId, subcategory);
    }

    EasyLoading.dismiss();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text(actionType == ActionType.Create ? "Create" : "Edit",
              style: Theme.of(context).primaryTextTheme.bodyText1),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Subcategory Name"),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              child: Text("Save"), onPressed: () => saveSubcategory(context))
        ],
      ),
    );
  }
}
