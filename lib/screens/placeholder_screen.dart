import 'package:flutter/material.dart';

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
          TextButton(
            child: Text("Button does nothing"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
