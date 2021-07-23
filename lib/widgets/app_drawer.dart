import 'package:ed_app/shared/firebase/auth_provider.dart';
import 'package:ed_app/shared/firebase/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  void logout(BuildContext context) {
    FirebaseAuthentication().logout();
    Provider.of<AuthProvider>(context, listen: false).setLogout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("EddApp"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () => logout(context),
          )
        ],
      ),
    );
  }
}
