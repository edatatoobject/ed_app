import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = DummyData.dummyCategories;

  List<Category> get items => [..._items];

  void add(String name, CategorySize size, IconData iconData) {
    var iconInfo = IconInfo(iconData.codePoint, iconData.fontFamily);
    var category = Category(
        id: DateTime.now().toString(),
        name: name,
        categorySize: size,
        iconInfo: iconInfo);

    _items.add(category);
    notifyListeners();
  }

  void edit(String categoryId, String name, CategorySize categorySize,
      IconData iconData) {
    var index = _findIndex(categoryId);

    var category = _items[index];

    var iconInfo = IconInfo(iconData.codePoint, iconData.fontFamily);
    var newCategory = Category(
        id: category.id,
        name: name,
        categorySize: categorySize,
        iconInfo: iconInfo);

    _items[index] = newCategory;

    notifyListeners();
  }

  void delete(String categoryId) {
    var index = _findIndex(categoryId);

    _items.removeAt(index);
    notifyListeners();
  }

  int _findIndex(String categoryId) {
    return _items.indexWhere((element) => element.id == categoryId);
  }
}
