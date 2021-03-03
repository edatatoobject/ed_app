import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconPicker extends StatefulWidget {
  final double iconSize;
  final Function(IconData) iconDataCallback;

  const IconPicker({Key key, @required this.iconDataCallback, this.iconSize})
      : super(key: key);

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  Icon _icon;

  double get iconSize => widget.iconSize == null ? 24 : widget.iconSize;
  _pickIcon() async {
    IconData iconData = await FlutterIconPicker.showIconPicker(context,
        iconPackMode: IconPack.fontAwesomeIcons);

    widget.iconDataCallback(iconData);
    setState(() {
      _icon = Icon(iconData, size: iconSize,);
    });
    debugPrint('Category Picked Icon:  $iconData');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _icon != null
                  ? _icon
                  : Icon(
                      FontAwesomeIcons.question,
                      size: iconSize,
                    )),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: _pickIcon,
            child: Text('Pick icon'),
          ),
        ]));
  }
}
