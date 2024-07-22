// user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:stackup_app/services/auth/auth_service.dart';

class UserProvider extends ChangeNotifier {
  String? _username;
  String? get username => _username;

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
