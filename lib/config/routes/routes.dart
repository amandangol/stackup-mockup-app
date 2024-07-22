import 'package:flutter/material.dart';
import 'package:stackup_app/bottomnav/bottomNavWrapper.dart';
import 'package:stackup_app/config/routes/routes_name.dart';
import 'package:stackup_app/screens/home_screen/home_screen.dart';
import 'package:stackup_app/screens/login_screen/login_screen.dart';
import 'package:stackup_app/screens/ongoing_campaigns/ongoing_campaigns.dart';
import 'package:stackup_app/screens/signup_screen/signup_screen.dart';
import 'package:stackup_app/screens/splash_screen/splash_screen.dart';

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
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.ongoingScreen:
        return MaterialPageRoute(
            builder: (context) => OngoingAndUpcomingCampaigns());
      case RoutesName.bottomNavHome:
        return MaterialPageRoute(builder: (context) => BottomNavHome());
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
