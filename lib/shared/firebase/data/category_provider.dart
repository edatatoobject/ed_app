import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/category.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';

class CategoryProviderFire {
  final collectionName = "category";
  final firestore_manager = FirestoreManager();

  //getting all categories
  Future<List<Category>> getCategories() async {
    var categoriesData = await firestore_manager.getAll(collectionName);

    var categories = _mapCategoryList(categoriesData);

    return categories;
  }

  //getting category by id
  Future<Category> getCategoryById(String categoryId) async {
    var categoryData =
        await firestore_manager.getById(collectionName, categoryId);

    var category = Category.fromMap(categoryData.id, categoryData.data());

    return category;
  }

  //getting categories by list of ids
  Future<List<Category>> getCategoriesByIds(List<String> categoryIds) async {
    var categoriesData =
        await firestore_manager.getByIds(collectionName, categoryIds);

    var categories = _mapCategoryList(categoriesData);

    return categories;
  }

  List<Category> _mapCategoryList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot
        .map((categoryData) =>
            Category.fromMap(categoryData.id, categoryData.data()))
        .toList();
  }
}
