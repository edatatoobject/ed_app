import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

part 'taskInSprint.g.dart';

class TaskInSprint extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get status => integer()();

  IntColumn get sprintId => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES sprints(id)')();

  IntColumn get taskId => integer()
      .nullable()
      .customConstraint('NULLABLE REFERENCES tasks(id)')();

}

@UseDao(tables: [TaskInSprint])
class TaskInSprintDao extends DatabaseAccessor<Database> with _$TaskInSprintDaoMixin {
  final Database db;

  TaskInSprintDao(this.db) : super(db);

  Future<List<TaskInSprintData>> getAll() => select(taskInSprint).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<TaskInSprintData>> watchAll() => select(taskInSprint).watch();

  // Updates a Task with a matching primary key
  Future updateEntity(TaskInSprintData taskInSprintModel) =>
      update(taskInSprint).replace(taskInSprintModel);

  Future deleteEntity(TaskInSprintData taskInSprintModel) =>
      delete(taskInSprint).delete(taskInSprintModel);

  close() {
    db.close();
  }
}