import 'package:ed_app/database/entities/category.dart';
import 'package:ed_app/database/entities/subcategory.dart';
import 'package:ed_app/database/entities/taskInSprint.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'entities/sprint.dart';
import 'entities/task.dart';

part 'database.g.dart';

@UseMoor(
    tables: [Category, Subcategory, Task, Sprint, TaskInSprint],
    daos: [CategoryDao, SubcategoryDao, TaskDao, SprintDao, TaskInSprintDao])
class Database extends _$Database {
  Database()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAllTables();
      }, beforeOpen: (details) async {
        if (details.wasCreated) {
          var category1 = await into(category).insert(const CategoryCompanion(
              name: Value("Category1"), size: Value(2)));
          var category2 = await into(category).insert(const CategoryCompanion(
              name: Value("Category2"), size: Value(2)));

          var subcategory11 = await into(subcategory).insert(
              SubcategoryCompanion(
                  name: Value("subcategory1-1"), categoryId: Value(category1)));
          var subcategory12 = await into(subcategory).insert(
              SubcategoryCompanion(
                  name: Value("subcategory1-2"), categoryId: Value(category1)));

          var subcategory21 = await into(subcategory).insert(
              SubcategoryCompanion(
                  name: Value("subcategory2-1"), categoryId: Value(category2)));
          var subcategory22 = await into(subcategory).insert(
              SubcategoryCompanion(
                  name: Value("subcategory2-2"), categoryId: Value(category2)));

          var task111 = await into(task).insert(TaskCompanion(
              status: Value(1),
              subcategoryId: Value(subcategory11),
              value: Value("task1-1-1")));
          var task121 = await into(task).insert(TaskCompanion(
              status: Value(1),
              subcategoryId: Value(subcategory12),
              value: Value("task1-1-1")));
          var task211 = await into(task).insert(TaskCompanion(
              status: Value(1),
              subcategoryId: Value(subcategory21),
              value: Value("task1-1-1")));
          var task221 = await into(task).insert(TaskCompanion(
              status: Value(1),
              subcategoryId: Value(subcategory22),
              value: Value("task1-1-1")));

          var sprint1 = await into(sprint).insert(SprintCompanion(
              startDate: Value(DateTime.now()),
              finishDate: Value(DateTime.now()),
              number: Value(1),
              duration: Value(7)));

          await into(taskInSprint).insert(TaskInSprintCompanion(
              status: Value(1),
              sprintId: Value(sprint1),
              taskId: Value(task111)));
          await into(taskInSprint).insert(TaskInSprintCompanion(
              status: Value(1),
              sprintId: Value(sprint1),
              taskId: Value(task121)));
          await into(taskInSprint).insert(TaskInSprintCompanion(
              status: Value(1),
              sprintId: Value(sprint1),
              taskId: Value(task211)));
          await into(taskInSprint).insert(TaskInSprintCompanion(
              status: Value(1),
              sprintId: Value(sprint1),
              taskId: Value(task221)));
        }
      });
}
