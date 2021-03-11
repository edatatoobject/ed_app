import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = DummyData.dummyCategories;

  List<Category> get items => [..._items];

  void addCategory(Category category) {
    _items.add(category);
    notifyListeners();
  }

  void editCategory(String categoryId, String name, CategorySize categorySize,
      IconData iconData) {
    var index = _items.indexWhere((element) => element.id == categoryId);

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

  void deleteCategory(String categoryId) {
    var index = _items.indexWhere((element) => element.id == categoryId);
    _items.removeAt(index);
    notifyListeners();
  }
}
