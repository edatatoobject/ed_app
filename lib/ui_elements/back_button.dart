import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  void popNavigation(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => popNavigation(context),
    );
  }
}
