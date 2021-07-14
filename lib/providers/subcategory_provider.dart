import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class SubcategoryProvider extends ChangeNotifier {
  final collectionName = "subcategory";
  final firestoreManager = FirestoreManager();

  //get all
  Future<List<Subcategory>> getAll() async {
    var subcategoriesData = await firestoreManager.getAll(collectionName);

    var subcategories = _mapSubcategoryList(subcategoriesData);

    return subcategories;
  }

  //get by id
  Future<Subcategory> getById(String subcategoryId) async {
    var subcategoryData =
        await firestoreManager.getById(collectionName, subcategoryId);

    var subcategory = Subcategory.fromMap(subcategoryData.id, subcategoryData.data());

    return subcategory;
  }

  //get range by list ids
  Future<List<Subcategory>> getByIds(List<String> subcategoryIds) async {
    var subcategoriesData =
        await firestoreManager.getByIds(collectionName, subcategoryIds);

    var subcategories = _mapSubcategoryList(subcategoriesData);

    return subcategories;
  }

  // get range by category id
  Future<List<Subcategory>> getByCategoryId(String categoryId) async {
    var subcategoriesData = await firestoreManager.getByEqualFilter(collectionName, "categoryId", categoryId);

    var subcategories = _mapSubcategoryList(subcategoriesData);

    return subcategories;
  }

  // get count by category id
  Future<int> getSubcategoryCount(String categoryId) async {
    return await firestoreManager.getSizeByEqualFilter(collectionName, "categoryId", categoryId);
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
