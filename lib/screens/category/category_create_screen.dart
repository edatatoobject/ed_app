import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/widgets/category_screen/icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateCategoryScreen extends StatelessWidget {
  static const String routeName = "/create-category";

  IconData _iconData;

  int sizeIndex = 0;
  List<CategorySize> categorySizes = [
    CategorySize.Small,
    CategorySize.Medium,
    CategorySize.Large
  ];

  TextEditingController controller = TextEditingController();

  void iconDataCallback(IconData iconData) {
    _iconData = iconData;
  }

  void changeSize(int index) {
    sizeIndex = index;
  }

  void saveCategory(BuildContext context) {
    Provider.of<CategoryDataBlock>(context, listen: false)
        .addCategory(controller.text, categorySizes[sizeIndex], _iconData);

    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconPicker(
              iconDataCallback: iconDataCallback,
              iconSize: 50,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "CategoryName"),
            ),
            SizedBox(
              height: 10,
            ),
            ToggleSwitch(
              initialLabelIndex: sizeIndex,
              labels: ['Small', 'Medium', 'Large'],
              activeBgColor: Theme.of(context).primaryColor,
              activeFgColor: Colors.white,
              onToggle: (index) => changeSize(index),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () => saveCategory(context),
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
