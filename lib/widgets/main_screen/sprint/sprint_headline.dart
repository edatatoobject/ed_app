import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:ed_app/models/sprint.dart';
import 'package:ed_app/screens/main_screen/sprint_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SprintHeadline extends StatelessWidget {
  const SprintHeadline({Key key}) : super(key: key);

  double getTimePassedPercentage(DateTime startDate, DateTime finishDate) {
    var totalSprintTime =
        finishDate.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;
    var elapsedSprintTime = DateTime.now().millisecondsSinceEpoch -
        startDate.millisecondsSinceEpoch;

    return elapsedSprintTime / totalSprintTime;
  }

  List<Widget> getSprintContent(BuildContext context) {
    var currentSprint =
        Provider.of<SprintDataBlock>(context).getCurrentSprint();

    List<Widget> sprintContent = [];

    sprintContent.add(AppBar(
      title: Row(children: getSprintAppBar(context, currentSprint)),
    ));

    if (currentSprint != null) {
      sprintContent.add(LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: 4,
          width: constraints.maxWidth,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: getTimePassedPercentage(
                    currentSprint.startDate, currentSprint.finishDate),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        );
      }));
    }

    return sprintContent;
  }

  List<Widget> getSprintAppBar(BuildContext context, Sprint currentSprint) {
    List<Widget> sprintAppBar = [];

    sprintAppBar.add(
      Text(currentSprint != null ? currentSprint.name : "No active Sprint"),
    );

    sprintAppBar.add(Spacer());

    if (currentSprint != null) {
      sprintAppBar.add(Text(
        "${currentSprint.finishDate.difference(DateTime.now()).inDays} days left",
        style: Theme.of(context).primaryTextTheme.subtitle1,
      ));
      sprintAppBar.add(IconButton(
          onPressed: () => 
          Navigator.of(context).pushNamed(
              SprintDetailScreen.routeName,
              arguments: currentSprint.id),
          icon: Icon(Icons.settings)));
    }

    return sprintAppBar;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(children: getSprintContent(context)),
    );
  }
}
