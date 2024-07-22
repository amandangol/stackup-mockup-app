import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? getCurrentUser() {
    _firebaseAuth.currentUser;
  }

  //sign up
  Future<UserCredential> signUpwithEmailandPassword(
      String email, password) async {
//try signup
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
//catch any werrors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign in
  Future<UserCredential> signInwithEmailandPassword(
      String email, password) async {
//try signin
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
//catch any werrors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
