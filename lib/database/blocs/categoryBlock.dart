import 'package:ed_app/database/database.dart';

import 'package:rxdart/rxdart.dart';

class CategoryBlock {
  final Database db;

  CategoryBlock() : db = Database();

  categoryDao() {
    return db.categoryDao;
  }

  Stream<List<CategoryData>> getCategoriesStream() {
    return db.categoryDao.watchAll();
  }
  
  Future<List<CategoryData>> getCategoriesFuture() {
    return db.categoryDao.getAll();
  }

  Stream<List<SubcategoryData>> getSubcategoriesStream(int categoryId) {
    return db.subcategoryDao.watchByCategoryId(categoryId);
  }
  
  Future<List<SubcategoryData>> getSubcategories(int categoryId) {
    return db.subcategoryDao.getByCategoryId(categoryId);
  }

  close() {
    db.close();
  }
}
