import 'package:flutter/material.dart';
import 'package:stackup_app/bottomnav/bottomNavWrapper.dart';
import 'package:stackup_app/config/routes/routes_name.dart';
import 'package:stackup_app/screens/home_screen/home_screen.dart';
import 'package:stackup_app/screens/authscreens/login_screen/login_screen.dart';
import 'package:stackup_app/screens/ongoing_campaigns/ongoing_campaigns.dart';
import 'package:stackup_app/screens/authscreens/signup_screen/signup_screen.dart';
import 'package:stackup_app/screens/splash_screen/splash_screen.dart';
import 'package:stackup_app/services/auth/auth_gate.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(
                  onTap: () {},
                ));
      case RoutesName.signupScreen:
        return MaterialPageRoute(
            builder: (context) => SignupScreen(
                  onTap: () {},
                ));
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.ongoingScreen:
        return MaterialPageRoute(
            builder: (context) => const OngoingAndUpcomingCampaigns());
      case RoutesName.bottomNavHome:
        return MaterialPageRoute(builder: (context) => const BottomNavHome());
      case RoutesName.authGate:
        return MaterialPageRoute(builder: (context) => const AuthGate());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text(
                      "No route generated",
                    ),
                  ),
                ));
    }
  }
}
