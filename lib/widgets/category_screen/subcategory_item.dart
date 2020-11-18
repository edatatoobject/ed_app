import 'package:ed_app/blocs/category_data_bloc.dart';
import 'package:ed_app/widgets/category_screen/task_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubcategoryItem extends StatefulWidget {
  final String name;
  final String id;

  const SubcategoryItem({Key key, @required this.name, @required this.id})
      : super(key: key);

  @override
  _SubcategoryItemState createState() => _SubcategoryItemState();
}

class _SubcategoryItemState extends State<SubcategoryItem> {
  bool _expanded = true;

  void expand() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dataBloc = Provider.of<CategoryDataBlock>(context);
    var tasks = dataBloc.getTasksBySubcategoryId(widget.id);

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.name),
              SizedBox(width: 10),
              Text(
                  "ToDo: ${dataBloc.getToDoTasksBySubcategoryId(widget.id).length}"),
              SizedBox(width: 10),
              Text(
                  "Done: ${dataBloc.getDoneTasksBySubcategoryId(widget.id).length}"),
              Spacer(),
              GestureDetector(
                child: Icon(_expanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                onTap: expand
              )
            ],
          ),
          Divider(
            height: 3,
          ),
          if (_expanded)
            Column(
              children: [
                ...tasks
                    .map((task) =>
                        TaskListItem(value: task.value, status: task.status))
                    .toList()
              ],
            ),
        ],
      ),
    );
  }
}
