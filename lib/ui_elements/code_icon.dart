import 'package:flutter/material.dart';

class CodeIcon extends StatelessWidget {
  final int code;
  final String fontFamily;

  const CodeIcon({Key key, @required this.code, @required this.fontFamily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Icon(IconData(code, fontPackage: "font_awesome_flutter", fontFamily: fontFamily));
  }
}
