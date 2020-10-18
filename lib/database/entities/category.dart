import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

part 'category.g.dart';

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  IntColumn get size => integer()();
}

@UseDao(tables: [Category])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  final Database db;

  CategoryDao(this.db) : super(db);

  Future<List<CategoryData>> getAllCategories() => select(category).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<CategoryData>> watchAllCategories() => select(category).watch();

  // Updates a Task with a matching primary key
  Future updateCategory(CategoryData categoryModel) =>
      update(category).replace(categoryModel);

  Future deleteCategory(CategoryData categoryModel) =>
      delete(category).delete(categoryModel);

  close() {
    db.close();
  }
}
