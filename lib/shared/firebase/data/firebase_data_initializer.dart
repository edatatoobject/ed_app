import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirebaseDataInitializer {
  static Future initData(BuildContext context) async {
    var categoryDataBlock =
        Provider.of<CategoryDataBlock>(context, listen: false);

    await categoryDataBlock.categoryProvider.initData();
    await categoryDataBlock.subcategoryProvider.initData();
    await categoryDataBlock.taskProvider.initData();

    var sprintDataBlock = Provider.of<SprintDataBlock>(context, listen: false);

    await sprintDataBlock.sprintProvider.initData();
    await sprintDataBlock.taskInSprintProvider.initData();
  }
}
