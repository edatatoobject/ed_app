import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

part 'sprint.g.dart';

class Sprint extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get number => integer()();

  IntColumn get duration => integer()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get finishDate => dateTime()();
}

@UseDao(tables: [Sprint])
class SprintDao extends DatabaseAccessor<Database> with _$SprintDaoMixin {
  final Database db;

  SprintDao(this.db) : super(db);

  Future<List<SprintData>> getAll() => select(sprint).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<SprintData>> watchAll() => select(sprint).watch();

  Future insertEntity(SprintData sprintModel) =>
      into(sprint).insert(sprintModel);

  // Updates a Task with a matching primary key
  Future updateEntity(SprintData sprintModel) =>
      update(sprint).replace(sprintModel);

  Future deleteEntity(SprintData sprintModel) =>
      delete(sprint).delete(sprintModel);

  close() {
    db.close();
  }
}
