import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:flutter/cupertino.dart';

class SubcategoryProvider extends ChangeNotifier {
  List<Subcategory> _items = DummyData.dummySubcategories;

  List<Subcategory> get items => [..._items];

  void addSubcategory(Subcategory subcategory) {
    _items.add(subcategory);
    notifyListeners();
  }
}
