import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:flutter/material.dart';

class SprintProvider extends ChangeNotifier {
  List<Sprint> _items = DummyData.sprints;

  List<Sprint> get items => [..._items];

  Sprint getCurrentSprint() {
    return _items.firstWhere((element) => DateTime.now().isBefore(element.finishDate));
  }
}