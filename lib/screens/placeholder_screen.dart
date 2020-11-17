import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Work in progress"),
          CircularProgressIndicator(),
          FlatButton(
            child: Text("Button does nothing"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
