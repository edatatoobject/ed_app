import 'package:ed_app/dto/category_in_sprint_dto.dart';
import 'package:ed_app/widgets/main_screen/category_detail_modal/taks_main_modal_item.dart';
import 'package:flutter/material.dart';

class CategoryMainDetailModal extends StatelessWidget {
  const CategoryMainDetailModal({Key key, this.categoryDto}) : super(key: key);

  final CategoryInSprintDto categoryDto;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            categoryDto.category.name,
            style: Theme.of(context)
                .primaryTextTheme
                .headline4, /* textAlign: TextAlign.center */
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: categoryDto.subcategories.map((subcategory) {
              return Column(
                children: [
                  Text(
                    subcategory.name,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  TaskMainModalItem(
                      tasks: categoryDto.tasks
                          .where((task) => task.subcategoryId == subcategory.id)
                          .toList(),
                      tasksInSprint: categoryDto.tasksInSprint)
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
