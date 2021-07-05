import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> createUser(String email, String password) async {
    try {
      UserCredential credintial = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credintial.user.uid;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<String> login(String email, String password) async {
    try {
      UserCredential credintial = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return credintial.user.uid;
    } on FirebaseAuthException catch (ex) {
      print(ex.message);
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
