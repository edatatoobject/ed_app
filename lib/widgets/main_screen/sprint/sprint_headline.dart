import 'package:ed_app/blocs/sprint_data_block.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SprintHeadline extends StatelessWidget {
  const SprintHeadline({Key key}) : super(key: key);

  double getTimePassedPercentage(DateTime startDate, DateTime finishDate){
    var totalSprintTime =  finishDate.millisecondsSinceEpoch -startDate.millisecondsSinceEpoch;
    var elapsedSprintTime = DateTime.now().millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

    return elapsedSprintTime / totalSprintTime;
  }

  @override
  Widget build(BuildContext context) {
    var currentSprint =
        Provider.of<SprintDataBlock>(context).getCurrentSprint();

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          AppBar(
            title: Row(
              children: [
                Text(currentSprint.name),
                Spacer(),
                Text(
                  "${currentSprint.finishDate.difference(DateTime.now()).inDays} days left",
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                )
              ],
            ),
          ),
          LayoutBuilder(builder: (context, constraints){
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
                  widthFactor: getTimePassedPercentage(currentSprint.startDate, currentSprint.finishDate),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            ),
          );
          })
          
        ],
      ),
    );
  }
}
