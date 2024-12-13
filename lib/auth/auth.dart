import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showToast(message: "The Email address is already in use.");
      } else {
        showToast(message: "An Error occurred: ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" ||
          e.code == "wrong-password" ||
          e.code == "invalid-credential") {
        showToast(message: "Invalid email or password");
      } else {
        showToast(message: "An Error occurred: ${e.code}");
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  void showToast({required String message}) {}

// @Override
// public void onStart() {
//     super.onStart();
//     // Check if user is signed in (non-null) and update UI accordingly.
//     FirebaseUser currentUser = mAuth.getCurrentUser();
//     if(currentUser != null){
//         reload();
//     }
// }
}
