import 'package:ed_app/screens/main_screen/sprint_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NoActiveSprint extends StatelessWidget {
  const NoActiveSprint({Key key}) : super(key: key);

  void startShit() async {
    EasyLoading.show(status: 'loading...', );

    await Future.delayed(Duration(seconds: 5));

    EasyLoading.dismiss();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "No active sprint found...",
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SprintDetailScreen.routeName),
              child: Text(
                "CREATE NEW SPRINT!",
              ))
        ],
      ),
    );
  }
}
