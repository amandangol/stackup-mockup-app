import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<String?> getCurrentUsername() async {
    User? user = getCurrentUser();
    if (user != null) {
      print("Current user UID: ${user.uid}");
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return userDoc.get('username') as String?;
      } else {
        print("User document does not exist for UID: ${user.uid}");
      }
    } else {
      print("No current user");
    }
    return null;
  }

  // Sign up
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store username in firestore
      // await _firestore.collection('users').doc(userCredential.user!.uid).set({
      //   'email': email,
      //   'username': username,
      // });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('FirebaseAuthException: ${e.message}');
    } catch (e) {
      throw Exception('Unknown Exception: $e');
    }
  }

  // Sign in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('FirebaseAuthException: ${e.message}');
    } catch (e) {
      throw Exception('Unknown Exception: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
