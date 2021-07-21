import 'package:flutter/cupertino.dart';

class FocusScopeTool {
  void dismissFocusScope(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
