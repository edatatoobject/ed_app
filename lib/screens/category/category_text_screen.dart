import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/enums/action_type.dart';
import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/tools/focus_scope_tool.dart';
import 'package:ed_app/widgets/icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryTextScreen extends StatefulWidget {
  static const String routeName = "/create-category";

  @override
  _CategoryTextScreenState createState() => _CategoryTextScreenState();
}

class _CategoryTextScreenState extends State<CategoryTextScreen> {
  IconData _iconData;

  String categoryId;

  ActionType actionType = ActionType.Create;

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

  Future saveCategory(BuildContext context) async {
    FocusScopeTool().dismissFocusScope(context);


    EasyLoading.show(status: 'loading...');

    var category = Category(
        name: controller.text,
        iconInfo: IconInfo(_iconData.codePoint, _iconData.fontFamily),
        categorySize: categorySizes[sizeIndex]);

    if (actionType == ActionType.Create) {
      await Provider.of<CategoryDataBlock>(context, listen: false)
          .categoryProvider
          .add(category);
    } else {
      await Provider.of<CategoryDataBlock>(context, listen: false)
          .categoryProvider
          .update(categoryId, category);
    }
    EasyLoading.dismiss();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var categoryId = ModalRoute.of(context).settings.arguments as String;

    if (categoryId != null) {
      this.categoryId = categoryId;
      actionType = ActionType.Edit;

      var product =
          Provider.of<CategoryDataBlock>(context).getCategoryById(categoryId);

      controller.text = product.name;
      _iconData = IconData(product.iconInfo.code,
          fontFamily: product.iconInfo.fontFamily,
          fontPackage: "font_awesome_flutter");
      sizeIndex = getSizeIndex(product.categorySize);
    }

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
            iconSize: 150,
            iconData: _iconData,
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
            inactiveBgColor: Theme.of(context).cardColor,
            activeBgColor: Theme.of(context).accentColor,
            activeFgColor: Theme.of(context).textTheme.subtitle2.color,
            onToggle: (index) => changeSize(index),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => saveCategory(context),
            child: Text("Save"),
          )
        ],
      ),
    ));
  }
}
