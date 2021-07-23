import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String name;
  final CategorySize categorySize;
  final IconInfo iconInfo;

  Category(
      {this.id,
      @required this.name,
      @required this.categorySize,
      @required this.iconInfo});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "categorySize": getSizeIndex(categorySize),
      "iconCode": iconInfo.code,
      "iconFontFamily": iconInfo.fontFamily,
    };
  }

  static Category fromMap(String id, Map<String, dynamic> mapData) {
    return Category(
        id: id,
        name: mapData["name"],
        categorySize: getSizeByIndex(mapData["categorySize"]),
        iconInfo: IconInfo(mapData["iconCode"], mapData["iconFontFamily"]));
  }

  static Category fromCategory(String id, Category category) {
    return Category(
        id: id,
        categorySize: category.categorySize,
        iconInfo: category.iconInfo,
        name: category.name);
  }
}
