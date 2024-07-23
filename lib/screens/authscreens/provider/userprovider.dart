// user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:stackup_app/services/auth/auth_service.dart';

class UserProvider extends ChangeNotifier {
  String? _username;
  String? _email;
  String? get username => _username;
  // String? get email => _email;

  final AuthService _authService = AuthService();

  Future<void> loadUsername() async {
    try {
      _username = await _authService.getCurrentUsername();
      print("Username loaded: $_username");
    } catch (e) {
      print("Error loading username: $e");
    }
    notifyListeners();
  }
}
