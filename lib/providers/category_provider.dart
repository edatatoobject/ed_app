import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final collectionName = "category";
  final firestoreManager = FirestoreManager();

  List<Category> _items = [];

  Future initData() async {
    var data = await firestoreManager.getAll(collectionName);
    _items = _mapCategoryList(data);
  }

  //get all
  List<Category> getAll() {
    return [..._items];
  }

  //get by id
  Category getById(String categoryId) {
    return _items.firstWhere((category) => category.id == categoryId);
  }

  //get range by list ids
  List<Category> getByIds(List<String> categoryIds) {
    return _items
        .where((category) => categoryIds.contains(category.id))
        .toList();
  }

  //add
  Future add(Category category) async {
    await firestoreManager.add(collectionName, category.toMap());

    notifyListeners();
  }

  //update
  Future update(String categoryId, Category category) async {
    await firestoreManager.update(collectionName, categoryId, category.toMap());

    notifyListeners();
  }

  //delete
  Future delete(String id) async {
    await firestoreManager.delete(collectionName, id);

    notifyListeners();
  }

  List<Category> _mapCategoryList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot
        .map((categoryData) =>
            Category.fromMap(categoryData.id, categoryData.data()))
        .toList();
  }
}
