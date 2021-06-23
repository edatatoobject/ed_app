import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/enums/task_in_sprint_status.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/models/taskInSprint.dart';
import 'package:ed_app/screens/main_screen/tasks_picker_screen.dart';
import 'package:ed_app/theme/custom_theme_data.dart';
import 'package:ed_app/tools/dateTimeTool.dart';
import 'package:ed_app/tools/formTool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SprintForm extends StatefulWidget {
  const SprintForm({Key key}) : super(key: key);

  @override
  _SprintFormState createState() => _SprintFormState();
}

class _SprintFormState extends State<SprintForm> {
  final _formKey = GlobalKey<FormState>();

  List<String> _pickedTasks;

  TextEditingController _nameController = TextEditingController();

  bool _tasksValidation = true;
  bool _dateValidation = true;

  DateTimeRange _dateTimeRange;

  void _pickDateRange() async {
    var lastSprint =
        Provider.of<SprintDataBlock>(context, listen: false).getLastSprint();

    var pickedRange = await DateTimeTools.showRangedDateTimePicker(
        context,
        _dateTimeRange == null ? null : _dateTimeRange.start,
        _dateTimeRange == null ? null : _dateTimeRange.end,
        borderDate: lastSprint == null ? null : lastSprint.finishDate);

    if (pickedRange == null) return;

    setState(() {
      _dateTimeRange = pickedRange;
    });
  }

  void _pickTasksForSprint() async {
    final tasks = await Navigator.pushNamed(
        context, TasksPickerScreen.routeName,
        arguments: _pickedTasks);

    if ((tasks as List<String>).isEmpty) {
      setState(() {
        _tasksValidation = false;
      });
    } else {
      setState(() {
        _tasksValidation = true;
      });
    }

    setState(() {
      _pickedTasks = tasks;
    });
  }

  bool _validateForm() {
    var formValidation = _formKey.currentState.validate();

    if (_dateTimeRange == null) {
      setState(() {
        _dateValidation = false;
      });
      return false;
    }

    if (_pickedTasks == null || _pickedTasks.isEmpty) {
      setState(() {
        _tasksValidation = false;
      });
      return false;
    }

    return formValidation;
  }

  void _confinm() {
    var sprint = new Sprint(
        name: _nameController.text,
        startDate: _dateTimeRange.start,
        finishDate: _dateTimeRange.end,
        duration: _dateTimeRange.duration.inDays,
        number: 1,
        id: Uuid().v4());

    List<TaskInSprint> tasksInSprint = _pickedTasks
        .map((task) => TaskInSprint(
            id: Uuid().v4(),
            sprintId: sprint.id,
            taskId: task,
            status: TaskInSprintStatus.Current))
        .toList();

    var sprintDataBlock = Provider.of<SprintDataBlock>(context, listen: false);

    sprintDataBlock.createSprint(sprint);
    sprintDataBlock.createTasks(tasksInSprint);

    Navigator.pop(context);
  }

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
                controller: _nameController,
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
                    _dateValidation
                        ? Text(_dateTimeRange != null
                            ? "${DateTimeTools.dateFormat(_dateTimeRange.start)} - ${DateTimeTools.dateFormat(_dateTimeRange.end)}"
                            : "Select date")
                        : Text(
                            "Select date",
                            style: TextStyle(color: Colors.red),
                          ),
                    Spacer(),
                    IconButton(
                        onPressed: () => _pickDateRange(),
                        icon: Icon(Icons.calendar_today))
                  ],
                ),
              ),
              Text(
                "Tasks in sprint",
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              ElevatedButton(
                  onPressed: () => _pickTasksForSprint(),
                  child: Text("Pick Tasks")),
              Text(
                "${_pickedTasks == null ? "0" : _pickedTasks.length} Tasks picked",
                style: TextStyle(
                    color: _tasksValidation
                        ? CustomThemeData.subForegroundColor
                        : Colors.red),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    if (_validateForm()) {
                      _confinm();
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ));
  }
}
