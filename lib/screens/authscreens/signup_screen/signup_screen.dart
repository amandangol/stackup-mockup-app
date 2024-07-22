import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackup_app/bottomnav/bottomNavWrapper.dart';
import 'package:stackup_app/common_widgets/custom_button.dart';
import 'package:stackup_app/common_widgets/custom_textfield.dart';
import 'package:stackup_app/screens/authscreens/login_screen/login_screen.dart';
import 'package:stackup_app/screens/home_screen/home_screen.dart';
import 'package:stackup_app/services/auth/auth_service.dart';
import 'package:stackup_app/services/auth/provider/auth_provider.dart';
import 'package:stackup_app/utils/error_messages.dart';
import 'package:stackup_app/utils/loading_dialog.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback? onTap;

  const SignupScreen({super.key, required this.onTap});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void register() async {
    final authService = AuthService();

    try {
      showLoadingDialog(context);
      await authService.signUpwithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
      hideLoadingDialog(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavHome(),
        ),
      );
    } catch (e) {
      hideLoadingDialog(context);

      print("Error: $e");
      print("Error Type: ${e.runtimeType}");

      String errorMessage = getErrorMessage(e as Exception);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ObscureProvider>(builder: (context, value, child) {
      return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/stackup_logo.png',
                  height: 150,
                  width: 150,
                ),
                Text(
                  "Create your account",
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's init your developer journey",
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    suffixIcon: value.isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onTap: value.toggleObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: value.isObscure),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm the password";
                    }
                    if (value != passwordController.text) {
                      return "Confirm password doesn't match the password";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: value.isObscure,
                  suffixIcon:
                      value.isObscure ? Icons.visibility_off : Icons.visibility,
                  onTap: value.toggleObscure,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: "Sign Up",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      return register();
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      onTap: widget.onTap,
                                    )));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
