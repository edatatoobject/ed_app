import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:flutter/cupertino.dart';

class SubcategoryProvider extends ChangeNotifier {
  List<Subcategory> _items = DummyData.dummySubcategories;

  List<Subcategory> get items => [..._items];

  void add(Subcategory subcategory) {
    _items.add(subcategory);
    notifyListeners();
  }

  void edit(String subcategoryId, String name) {
    var index = _items.indexWhere((element) => element.id == subcategoryId);

    var subcategory = _items[index];

    var updatedSubcategory = Subcategory(
        id: subcategory.id, categoryId: subcategory.categoryId, name: name);

    _items[index] = updatedSubcategory;
  }

  void delete(String subcategoryId) {
    var index = _items.indexWhere((element) => element.id == subcategoryId);
    _items.removeAt(index);
    notifyListeners();
  }
}
