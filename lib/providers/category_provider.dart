import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/category.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = DummyData.dummyCategories;

  List<Category> get items => [..._items];

  void addCategory(Category category) {
    _items.add(category);
    notifyListeners();
  }
}
