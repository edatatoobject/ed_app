import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/screens/main_screen/tasks_picker_screen.dart';
import 'package:ed_app/tools/dateTimeTool.dart';
import 'package:ed_app/tools/formTool.dart';
import 'package:ed_app/widgets/main_screen/sprint/sprint_detail_screen/tasks/tasks_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SprintForm extends StatefulWidget {
  const SprintForm({Key key}) : super(key: key);

  @override
  _SprintFormState createState() => _SprintFormState();
}

class _SprintFormState extends State<SprintForm> {
  final _formKey = GlobalKey<FormState>();

  List<String> pickedTasks;

  void setTasks(List<String> tasksIds) {
    pickedTasks = tasksIds;
  }

  bool dateValidation = true;

  DateTimeRange dateTimeRange;

  void pickDateRange(BuildContext context) async {
    var lastSprint =
        Provider.of<SprintDataBlock>(context, listen: false).getLastSprint();

    var pickedRange = await DateTimeTools.showRangedDateTimePicker(
        context,
        dateTimeRange == null ? null : dateTimeRange.start,
        dateTimeRange == null ? null : dateTimeRange.end,
        borderDate: lastSprint == null ? null : lastSprint.finishDate);

    if (pickedRange == null) return;

    setState(() {
      dateTimeRange = pickedRange;
    });
  }

  void pickTasksForSprint(BuildContext context) async {
    final tasks =
        await Navigator.pushNamed(context, TasksPickerScreen.routeName, arguments: pickedTasks);

    if (tasks == null) 
      return;
    
    pickedTasks = tasks;
  }

  bool validateForm() {
    var formValidation = _formKey.currentState.validate();

    if (dateTimeRange == null) {
      setState(() {
        dateValidation = false;
      });
      return false;
    }

    return formValidation;
  }

  void confinm() {}

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Expanded(
          child: Column(
            children: [
              Text(
                "Sprint Name",
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Sprint Name"),
                validator: FormTool.emptyFieldValidator,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Sprint date",
                  style: Theme.of(context).primaryTextTheme.subtitle1),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    dateValidation
                        ? Text(dateTimeRange != null
                            ? "${DateTimeTools.dateFormat(dateTimeRange.start)} - ${DateTimeTools.dateFormat(dateTimeRange.end)}"
                            : "Select date")
                        : Text(
                            "Select date",
                            style: TextStyle(color: Colors.red),
                          ),
                    Spacer(),
                    IconButton(
                        onPressed: () => pickDateRange(context),
                        icon: Icon(Icons.calendar_today))
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => pickTasksForSprint(context),
                  child: Text("Pick Categories")),
              ElevatedButton(
                  onPressed: () {
                    if (validateForm()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ));
  }
}
