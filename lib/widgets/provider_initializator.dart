import 'package:ed_app/screens/auth/auth_screen.dart';
import 'package:ed_app/screens/bottom_tabs_screen.dart';
import 'package:ed_app/shared/firebase/auth_provider.dart';
import 'package:ed_app/shared/firebase/data/firebase_data_initializer.dart';
import 'package:ed_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderInitialization extends StatefulWidget {
  const ProviderInitialization({Key key}) : super(key: key);

  @override
  _ProviderInitializationState createState() => _ProviderInitializationState();
}

class _ProviderInitializationState extends State<ProviderInitialization> {
  bool initialized = false;

  void initData(BuildContext context) async {
    if (!initialized) {
      await FirebaseDataInitializer.initData(context);
    }

    setState(() {
      initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.authtorized) {
      initData(context);
    }

    return !authProvider.authtorized
        ? AuthScreen()
        : initialized
            ? BottomTabsScreen()
            : Loading();
  }
}
