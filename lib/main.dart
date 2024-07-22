import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackup_app/config/routes/routes.dart';
import 'package:stackup_app/config/routes/routes_name.dart';
import 'package:stackup_app/firebase_options.dart';
import 'package:stackup_app/screens/authscreens/provider/userprovider.dart';
import 'package:stackup_app/services/auth/provider/auth_provider.dart';
import 'package:stackup_app/screens/splash_screen/splash_screen.dart';
import 'package:stackup_app/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ObscureProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StackUp',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreen(),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
