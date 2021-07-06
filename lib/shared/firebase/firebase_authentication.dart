import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  Future<String> signInWithGoogle() async {
    var googleSignInAccount = await _googleSignIn.signIn();

    var googleSignInAuthentication = await googleSignInAccount.authentication;

    var authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    var authResult = await _firebaseAuth.signInWithCredential(authCredential);

    var user = authResult.user;

    if (user != null) {
      return "$user";
    }

    return null;
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
