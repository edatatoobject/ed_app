import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/providers/sprint_provider.dart';
import 'package:flutter/material.dart';

class SprintDataBlock extends ChangeNotifier {
  SprintProvider sprintProvider;

  List<Sprint> _sprints;

  void update(SprintProvider sprintProvider) {
    this.sprintProvider = sprintProvider;
    _sprints = this.sprintProvider.items;
  }

  Sprint getCurrentSprint() {
    return sprintProvider.getCurrentSprint();
  }
}
