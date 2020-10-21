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

  Future<List<CategoryData>> getAll() => select(category).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<CategoryData>> watchAll() => select(category).watch();
  
  Future insertEntity(CategoryData categoryModel) =>
      into(category).insert(categoryModel);

  // Updates a Task with a matching primary key
  Future updateEntity(CategoryData categoryModel) =>
      update(category).replace(categoryModel);

  Future deleteEntity(CategoryData categoryModel) =>
      delete(category).delete(categoryModel);

  close() {
    db.close();
  }
}
