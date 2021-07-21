import 'package:flutter/material.dart';

class Subcategory {
  final String id;
  final String name;
  final String categoryId;

  Subcategory({this.id, @required this.name, @required this.categoryId});

  Map<String, dynamic> toMap() {
    return {"categoryId": categoryId, "name": name};
  }

  static Subcategory fromMap(String id, Map<String, dynamic> mapData) {
    return Subcategory(
        id: id, categoryId: mapData["categoryId"], name: mapData["name"]);
  }
}
