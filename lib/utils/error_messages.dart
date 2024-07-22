import 'package:firebase_auth/firebase_auth.dart';

String getErrorMessage(Object e) {
  if (e is FirebaseAuthException) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  } else if (e is Exception) {
    // Handle generic exceptions
    switch (e.toString()) {
      case 'Exception: invalid-email':
        return 'The email address is badly formatted.';
      case 'Exception: user-not-found':
        return 'No user found with this email.';
      case 'Exception: wrong-password':
        return 'Incorrect password.';
      case 'Exception: invalid-credential':
        return "Email or password doesn't match.";
      case 'Exception: email-already-in-use':
        return "Email is already registered";
      case 'Exception: weak-password':
        return "Password is too weak";
      default:
        return 'An unknown error occurred. Please try again.';
    }
  } else {
    return 'An unknown error occurred. Please try again.';
  }
}
