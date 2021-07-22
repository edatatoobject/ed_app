import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/shared/firebase/data/firestore_manager.dart';
import 'package:flutter/material.dart';

class SprintProvider extends ChangeNotifier {
  final collectionName = "sprint";
  final firestoreManager = FirestoreManager();

  final List<Sprint> _items = [];

  Future initData() async {
    if (_items.length == 0) {
      var data = await firestoreManager.getAll(collectionName);
      _items.addAll(_mapSprintList(data));
    }
  }

  List<Sprint> getAll() {
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

  void add(Sprint sprint) async {
    await firestoreManager.add(collectionName, sprint.toMap());

    notifyListeners();
  }

  void update(Sprint sprint) async {
    await firestoreManager.update(
        collectionName, sprint.id, sprint.toMap());

    notifyListeners();
  }

  List<Sprint> _mapSprintList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return snapshot
        .map((categoryData) =>
            Sprint.fromMap(categoryData.id, categoryData.data()))
        .toList();
  }
}
