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
          IntrinsicHeight(
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 20),
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
                    onTap: expand)
              ],
            ),
          ),
          Divider(
            height: 3,
          ),
          if (_expanded)
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 1, color: Colors.grey[200]))),
              padding: EdgeInsets.only(
                left: 5,
              ),
              child: Column(
                children: [
                  ...tasks
                      .map((task) =>
                          TaskListItem(value: task.value, status: task.status))
                      .toList()
                ],
              ),
            ),
        ],
      ),
    );
  }
}
