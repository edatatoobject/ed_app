import 'package:ed_app/theme/custom_theme_data.dart';
import 'package:ed_app/tools/dateTimeTool.dart';
import 'package:ed_app/tools/formTool.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SprintForm extends StatefulWidget {
  const SprintForm({Key key}) : super(key: key);

  @override
  _SprintFormState createState() => _SprintFormState();
}

class _SprintFormState extends State<SprintForm> {
  final _formKey = GlobalKey<FormState>();

  bool startDateValidationWarning = false;
  bool finishDateValidationWarning = false;

  DateTime startDate;
  DateTime finishDate;

  List<Widget> _getStartDateWidgetSequence(BuildContext context) {
    List<Widget> widgetList = [];

    if (startDateValidationWarning) {
      widgetList.add(Text("Select date", style: TextStyle(color: Colors.red)));
    } else {
      widgetList.add(Text(startDate == null
          ? "Select date"
          : DateFormat('dd.MM.yyyy').format(startDate)));
    }

    widgetList.add(Spacer());

    if (DateTimeTools.getDate(DateTime.now()) != startDate) {
      widgetList.add(
        ElevatedButton(
            onPressed: () => _pickTodayForStartDate(),
            child: Text(
              "Today",
              style: Theme.of(context).primaryTextTheme.subtitle2,
            )),
      );
    }

    widgetList.add(IconButton(
        onPressed: () => _pickStartDate(context),
        icon: Icon(Icons.calendar_today)));

    return widgetList;
  }

  List<Widget> _getFinishDateWidgetSequence(BuildContext context) {
    List<Widget> widgetList = [];

    if (finishDateValidationWarning) {
      widgetList.add(Text("Select date", style: TextStyle(color: Colors.red)));
    } else {
      widgetList.add(Text(finishDate == null
          ? "Select date"
          : DateFormat('dd.MM.yyyy').format(finishDate)));
    }

    widgetList.add(Spacer());

    if (startDate != null &&
        DateTimeTools.getDate(startDate.add(Duration(days: 7))) != finishDate) {
      widgetList.add(
        ElevatedButton(
            onPressed: () => _pickWeekForFinishDate(),
            child: Text(
              "1 Week",
              style: Theme.of(context).primaryTextTheme.subtitle2,
            )),
      );
    }

    widgetList.add(IconButton(
        onPressed: () => _pickFinishDate(context),
        icon: Icon(Icons.calendar_today)));

    return widgetList;
  }

  //date staff

  void _pickStartDate(BuildContext context) async {
    var newStartDate =
        await DateTimeTools.showDateTimePicker(context, startDate);

    if (newStartDate != null && newStartDate != startDate)
      setState(() {
        startDate = newStartDate;
        startDateValidationWarning = false;
      });
  }

  void _pickFinishDate(BuildContext context) async {
    var newFinishDate =
        await DateTimeTools.showDateTimePicker(context, finishDate);

    if (newFinishDate != null && newFinishDate != startDate)
      setState(() {
        finishDate = newFinishDate;
        finishDateValidationWarning = false;
      });
  }

  void _pickTodayForStartDate() {
    setState(() {
      startDate = DateTimeTools.getDate(DateTime.now());
      startDateValidationWarning = false;
    });
  }

  void _pickWeekForFinishDate() {
    if (startDate == null) return;

    setState(() {
      finishDate = startDate.add(Duration(days: 7));
      finishDateValidationWarning = false;
    });
  }

  bool validateForm() {
    var formValidation = _formKey.currentState.validate();

    if (startDate == null && finishDate == null) {
      setState(() {
        if (startDate == null) startDateValidationWarning = true;
        if (finishDate == null) finishDateValidationWarning = true;
      });
      return false;
    }

    return true && formValidation;
  }

  void confinm() {}

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
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
            Text("Start date",
                style: Theme.of(context).primaryTextTheme.subtitle1),
            Row(children: _getStartDateWidgetSequence(context)),
            Text("Finish date",
                style: Theme.of(context).primaryTextTheme.subtitle1),
            Row(children: _getFinishDateWidgetSequence(context)),
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
        ));
  }
}
