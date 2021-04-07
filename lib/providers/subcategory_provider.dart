import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:flutter/cupertino.dart';

class SubcategoryProvider extends ChangeNotifier {
  List<Subcategory> _items = DummyData.dummySubcategories;

  List<Subcategory> get items => [..._items];

  void add(String name, String categoryId) {
    var subcategory = Subcategory(
        id: DateTime.now().toString(), categoryId: categoryId, name: name);
    _items.add(subcategory);
    notifyListeners();
  }

  void edit(String subcategoryId, String name) {
    var index = _findIndex(subcategoryId);

    var subcategory = _items[index];

    var updatedSubcategory = Subcategory(
        id: subcategory.id, categoryId: subcategory.categoryId, name: name);

    _items[index] = updatedSubcategory;

    notifyListeners();
  }

  void delete(String subcategoryId, bool notify) {
    var index = _findIndex(subcategoryId);
    _items.removeAt(index);

    if(notify)
    {
      notifyListeners();
    }
  }

  int _findIndex(String subcategoryId) {
    return _items.indexWhere((element) => element.id == subcategoryId);
  }
}
