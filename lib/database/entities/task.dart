import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

part 'task.g.dart';

class Task extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get value => text().withLength(min: 1, max: 50)();

  IntColumn get status => integer()();

  IntColumn get subcategoryId => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES subcategories(id)')();

}

@UseDao(tables: [Task])
class TaskDao extends DatabaseAccessor<Database> with _$TaskDaoMixin {
  final Database db;

  TaskDao(this.db) : super(db);

  Future<List<TaskData>> getAll() => select(task).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<TaskData>> watchAll() => select(task).watch();

  
  Future insertEntity(TaskData taskData) =>
      into(task).insert(taskData);

  // Updates a Task with a matching primary key
  Future updateEntity(TaskData taskModel) =>
      update(task).replace(taskModel);

  Future deleteEntity(TaskData taskModel) =>
      delete(task).delete(taskModel);

  close() {
    db.close();
  }
}
