import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class CategoryProviderFire extends ChangeNotifier {
  final collectionName = "category";
  final firestoreManager = FirestoreManager();

  //get all
  Future<List<Category>> getAll() async {
    var categoriesData = await firestoreManager.getAll(collectionName);

    var categories = _mapCategoryList(categoriesData);

    return categories;
  }

  //get by id
  Future<Category> getById(String categoryId) async {
    var categoryData =
        await firestoreManager.getById(collectionName, categoryId);

    var category = Category.fromMap(categoryData.id, categoryData.data());

    return category;
  }

  //get range by list ids
  Future<List<Category>> getByIds(List<String> categoryIds) async {
    var categoriesData =
        await firestoreManager.getByIds(collectionName, categoryIds);

    var categories = _mapCategoryList(categoriesData);

    return categories;
  }

  //add 
  Future add(Category category) async {
    await firestoreManager.add(collectionName, category.toMap());

    notifyListeners();
  }

  //update
  Future update(Category category) async {
    await firestoreManager.update(
        collectionName, category.id, category.toMap());

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
