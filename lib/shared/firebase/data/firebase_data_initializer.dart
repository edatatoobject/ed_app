import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirebaseDataInitializer {
  static Future InitData(BuildContext context) {
    var categoryDataBlock =
        Provider.of<CategoryDataBlock>(context, listen: false);

    categoryDataBlock.categoryProvider.initData();
    categoryDataBlock.subcategoryProvider.initData();
    categoryDataBlock.taskProvider.initData();

    var sprintDataBlock = Provider.of<SprintDataBlock>(context, listen: false);

    sprintDataBlock.sprintProvider.initData();
    sprintDataBlock.taskInSprintProvider.initData();
  }
}
