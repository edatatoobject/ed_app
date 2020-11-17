import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/task.dart';
import 'package:flutter/cupertino.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _items = DummyData.dummyTasks;

  List<Task> get items => [..._items];
}
