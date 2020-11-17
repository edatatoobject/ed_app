import 'package:flutter/material.dart';

class CodeIcon extends StatelessWidget {
  final int code;
  final String fontFamily;
  final double size;

  const CodeIcon({Key key, @required this.code, @required this.fontFamily, this.size = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(code,
          fontPackage: "font_awesome_flutter", fontFamily: fontFamily),
          size: size == null ? 24 : size,
    );
  }
}
