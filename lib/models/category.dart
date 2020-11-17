import 'package:ed_app/enums/category_size.dart';
import 'package:ed_app/models/icon_data.dart';
import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String name;
  final CategorySize categorySize;
  final IconInfo iconInfo;

  Category(
      {@required this.id,
      @required this.name,
      @required this.categorySize,
      @required this.iconInfo});
}
