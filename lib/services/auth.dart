import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //register with email

  String? getUsername() {
    return _auth.currentUser?.displayName;
  }

  Future registerEmail(
      String userEmail, String userPassword, String username) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  //sign in with email
  Future loginEmail(String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
