import 'package:ed_app/models/category.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/models/subcategory.dart';
import 'package:ed_app/models/task.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/enums/task_status.dart';

class DummyData {
  static List<Category> dummyCategories = [
    Category(id: "c1", name: "C#", categorySize: CategorySize.Large, iconInfo: IconInfo(62312, "FontAwesomeBrands")),
    Category(id: "c2", name: "Flutter", categorySize: CategorySize.Medium, iconInfo: IconInfo(62137, "FontAwesomeRegular") ),
    Category(id: "c3", name: "Docker", categorySize: CategorySize.Small, iconInfo: IconInfo(62316, "FontAwesomeBrands") )
  ];

  static List<Subcategory> dummySubcategories = [
    Subcategory(id: "sc1", name: "DI", categoryId: "c1"),
    Subcategory(id: "sc2", name: "Cryptography", categoryId: "c1"),
    Subcategory(id: "sc3", name: "CreateApp", categoryId: "c2"),
    Subcategory(id: "sc4", name: "WidgetInspection", categoryId: "c2"),
    Subcategory(id: "sc5", name: "Learn containers", categoryId: "c3"),
    Subcategory(id: "sc6", name: "Compose", categoryId: "c3"),
  ];

  static List<Task> dummyTasks = [
    Task(
        id: "t1",
        value: "Learn DI container",
        subcategoryId: "sc1",
        status: TaskStatus.ToDo),
    Task(
        id: "t2",
        value: "Try week binding",
        description: "",
        subcategoryId: "sc1",
        status: TaskStatus.ToDo),
    Task(
        id: "t3",
        value: "Try week binding",
        description: "",
        subcategoryId: "sc1",
        status: TaskStatus.Done),
    Task(
        id: "t4",
        value: "Symmetric crypto",
        description: "",
        subcategoryId: "sc2",
        status: TaskStatus.ToDo),
    Task(
        id: "t5",
        value: "Arcitecture",
        description: "Build acitecture",
        subcategoryId: "sc3",
        status: TaskStatus.ToDo),
    Task(
        id: "t6",
        value: "Future Builder",
        description: "Learn how it works",
        subcategoryId: "sc4",
        status: TaskStatus.ToDo),
    Task(
        id: "t7",
        value: "Up postgresql",
        description: "",
        subcategoryId: "sc5",
        status: TaskStatus.ToDo),
    Task(
        id: "t8",
        value: "just a dummy task",
        description: "ya it is",
        subcategoryId: "sc5",
        status: TaskStatus.ToDo),
    Task(
        id: "t9",
        value: "Create composer",
        description: "Learn composer",
        subcategoryId: "sc6",
        status: TaskStatus.ToDo),
  ];

  static Sprint sprint = Sprint(
      id: "spr1",
      number: 1,
      startDate: DateTime.now(),
      finishDate: DateTime.now().add(Duration(days: 7)),
      duration: 7);

  static List<TaskInSprint> taskInSprint = [
    TaskInSprint(
        id: "ts1",
        sprintId: "spr1",
        taskId: "t1",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts2",
        sprintId: "spr1",
        taskId: "t2",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts3",
        sprintId: "spr1",
        taskId: "t3",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts4",
        sprintId: "spr1",
        taskId: "t4",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts5",
        sprintId: "spr1",
        taskId: "t5",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts6",
        sprintId: "spr1",
        taskId: "t6",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts7",
        sprintId: "spr1",
        taskId: "t7",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts8",
        sprintId: "spr1",
        taskId: "t8",
        status: TaskInSprintStatus.Current),
    TaskInSprint(
        id: "ts9",
        sprintId: "spr1",
        taskId: "t9",
        status: TaskInSprintStatus.Current)
  ];
}
