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
      case 'email-already-in-use':
        return "Email is already registered";
      case 'weak-password':
        return "Password is too weak";
      default:
        return 'An unknown error occurred. Please try again.';
    }
  } else if (e is Exception) {
    final message = e.toString();
    if (message.contains('FirebaseAuthException')) {
      if (message.contains('The email address is badly formatted.')) {
        return 'The email address is badly formatted.';
      } else if (message.contains('user-not-found')) {
        return 'No user found with this email.';
      } else if (message.contains(
          'The email address is already in use by another account.')) {
        return 'The email address is already in use by another account';
      } else if (message.contains('wrong-password')) {
        return 'Incorrect password.';
      } else if (message.contains(
          'The supplied auth credential is incorrect, malformed or has expired.')) {
        return "Email or password doesn't match.";
      } else if (message.contains('email-already-in-use')) {
        return "Email is already registered";
      } else if (message.contains('weak-password')) {
        return "Password is too weak";
      } else if (message.contains('Password should be at least 6 characters')) {
        return 'Password is too weak';
      } else {
        return 'An unknown error occurred. Please try again.';
      }
    } else {
      return 'An unknown error occurred. Please try again.';
    }
  } else {
    return 'An unknown error occurred. Please try again.';
  }
}
