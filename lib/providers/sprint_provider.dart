import 'package:ed_app/dev_src/dummy_data.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:flutter/material.dart';

class SprintProvider extends ChangeNotifier {
  List<Sprint> _items = DummyData.sprints;

  List<Sprint> get items {
    if (_items == null) return null;

    return [..._items];
  }

  Sprint getCurrentSprint() {
    if (_items == null) {
      return null;
    }
    return _items.firstWhere(
        (element) => DateTime.now().isBefore(element.finishDate),
        orElse: () => null);
  }

  void addSprint(Sprint sprint) {
    _items.add(sprint);

    notifyListeners();
  }

  void updateSprint(Sprint sprint) {
    var index = _items.indexWhere((oldSprint) => oldSprint.id == sprint.id);

    _items[index] = sprint;

    notifyListeners();
  }
}
