import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateSubcategory extends StatelessWidget {
  final String categoryId;

  CreateSubcategory({Key key, @required this.categoryId}) : super(key: key);

  final controller = TextEditingController();


  void saveSubcategory(BuildContext context) {
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
          RaisedButton(child: Text("Save"), onPressed: () => saveSubcategory(context))
        ],
      ),
    );
  }
}
