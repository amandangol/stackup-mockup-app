import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stackup_app/services/splash_services.dart';
import 'package:stackup_app/utils/size_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    _splashServices.isNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: const Color.fromARGB(255, 249, 224, 224),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/stackup_logo.png',
            height: 250,
            width: 250,
          ),
          // Text(
          //   "#LearnAndEarn",
          //   style: GoogleFonts.anton(fontSize: 20, letterSpacing: 2),
          // ),
          SizedBox(
            height: 0.03.h(context),
          ),
          const SpinKitChasingDots(
            color: Color.fromARGB(218, 245, 94, 89),
          )
        ],
      ),
    );
  }
}
