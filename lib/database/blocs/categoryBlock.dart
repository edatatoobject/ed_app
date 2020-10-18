import 'package:ed_app/database/database.dart';

import 'package:rxdart/rxdart.dart';

class CategoryBlock {
  final Database db;

  CategoryBlock() : db = Database();

  categoryDao() {
    return db.categoryDao;
  }

  Stream<List<CategoryData>> getCategoriesStream() {
    return db.categoryDao.watchAllCategories();
  }
  
  Future<List<CategoryData>> getCategoriesFuture() {
    return db.categoryDao.getAllCategories();
  }

  Stream<List<SubcategoryData>> getSubcategoriesStream(int categoryId) {
    return db.subcategoryDao.watchSubcategoriesByCategoryId(categoryId);
  }
  
  Future<List<SubcategoryData>> getSubcategories(int categoryId) {
    return db.subcategoryDao.getSubcategoriesByCategoryId(categoryId);
  }

  close() {
    db.close();
  }
}
