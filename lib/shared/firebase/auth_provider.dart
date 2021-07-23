import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool authtorized;

  AuthProvider() {
    authtorized = FirebaseAuth.instance.currentUser != null;
  }

  void setLogin() {
    authtorized = true;
    notifyListeners();
  }

  void setLogout() {
    authtorized = false;
    notifyListeners();
  }
}
