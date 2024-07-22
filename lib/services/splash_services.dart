import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:stackup_app/config/routes/routes_name.dart';

class SplashServices {
  void isNavigate(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.authGate,
        (route) => false,
      );
    });
  }
}
