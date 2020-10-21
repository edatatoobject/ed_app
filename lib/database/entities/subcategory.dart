import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

part 'subcategory.g.dart';

class Subcategory extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  IntColumn get categoryId => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES categories(id)')();
}

@UseDao(tables: [Subcategory])
class SubcategoryDao extends DatabaseAccessor<Database>
    with _$SubcategoryDaoMixin {
  final Database db;

  SubcategoryDao(this.db) : super(db);

  close() {
    db.close();
  }

  Stream<List<SubcategoryData>> watchAll() =>
      select(subcategory).watch();

  Future<List<SubcategoryData>> getAll() =>
      select(subcategory).get();

  Stream<List<SubcategoryData>> watchByCategoryId(int categoryId) {
    return (select(subcategory)
          ..where((tbl) => tbl.categoryId.equals(categoryId)))
        .watch();
  }

  Future<List<SubcategoryData>> getByCategoryId(int categoryId) {
    return (select(subcategory)
          ..where((tbl) => tbl.categoryId.equals(categoryId)))
        .get();
  }

  Future insertEntity(SubcategoryData subcategoryModel) =>
      into(subcategory).insert(subcategoryModel);

  // Updates a Task with a matching primary key
  Future updateEntity(SubcategoryData subcategoryModel) =>
      update(subcategory).replace(subcategoryModel);

  Future deleteEntity(SubcategoryData subcategoryModel) =>
      delete(subcategory).delete(subcategoryModel);
}
