import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class SubcategoryProvider extends ChangeNotifier {
  final collectionName = "subcategory";
  final firestoreManager = FirestoreManager();

  final List<Subcategory> _items = [];

  Future uploadData() async {
    var categoriesData = await firestoreManager.getAll(collectionName);
    _items.addAll(_mapSubcategoryList(categoriesData));
  }

  //get all
  List<Subcategory> getAll() {
    return [..._items];
  }

  //get by id
  Subcategory getById(String subcategoryId) {
    return _items.firstWhere((subcategory) => subcategory.id == subcategoryId);
  }

  //get range by list ids
  List<Subcategory> getByIds(List<String> subcategoryIds) {
    return _items
        .where((subcategory) => subcategoryIds.contains(subcategory.id))
        .toList();
  }

  // get range by category id
  List<Subcategory> getByCategoryId(String categoryId) {
    return _items
        .where((subcategory) => subcategory.categoryId == categoryId)
        .toList();
  }

  // get count by category id
  int getSubcategoryCount(String categoryId) {
    return _items
        .where((subcategory) => subcategory.categoryId == categoryId)
        .length;
  }

  //add
  Future add(Subcategory subcategory) async {
    await firestoreManager.add(collectionName, subcategory.toMap());

    notifyListeners();
  }

  //update
  Future update(Subcategory subcategory) async {
    await firestoreManager.update(
        collectionName, subcategory.id, subcategory.toMap());

    notifyListeners();
  }

  //delete
  Future delete(String id) async {
    await firestoreManager.delete(collectionName, id);

    notifyListeners();
  }

  List<Subcategory> _mapSubcategoryList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot
        .map((categoryData) =>
            Subcategory.fromMap(categoryData.id, categoryData.data()))
        .toList();
  }
}
