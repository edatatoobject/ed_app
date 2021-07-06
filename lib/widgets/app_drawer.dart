import 'package:ed_app/screens/auth/auth_screen.dart';
import 'package:ed_app/shared/firebase/firebase_authentication.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key key }) : super(key: key);

  void logout(){
    FirebaseAuthentication().logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(title: Text("EddApp"),automaticallyImplyLeading: false,),
        ListTile(leading: Icon(Icons.exit_to_app),
        title: Text("Logout"),
        onTap: logout,)
      ],),
    );
  }
}