import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stackup_app/common_widgets/custom_button.dart';
import 'package:stackup_app/common_widgets/custom_textfield.dart';
import 'package:stackup_app/config/routes/routes_name.dart';
import 'package:stackup_app/screens/authscreens/login_screen/login_screen.dart';
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
  final TextEditingController usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void register() async {
    final authService = AuthService();

    try {
      showLoadingDialog(context);
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
        // usernameController.text,
      );
      print("${usernameController.text}aas");
      // hideLoadingDialog(context);

      Navigator.pushNamed(context, RoutesName.bottomNavHome);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: const Text("Signed up succesfully"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
        ),
      );
    } catch (e) {
      hideLoadingDialog(context);

      print("Error: $e");
      print("Error Type: ${e.runtimeType}");

      String errorMessage = getErrorMessage(e);

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

  bool _isConfirmPwVisible = false;

  void _toggleConfirmPwVisibility() {
    setState(() {
      _isConfirmPwVisible = !_isConfirmPwVisible;
    });
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
                  style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
                      letterSpacing: 2,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                    labelText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                // CustomTextField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please enter your stackiename";
                //       }
                //       return null;
                //     },
                //     controller: usernameController,
                //     hintText: "Stackiename",
                //     obscureText: false),
                // const SizedBox(
                //   height: 10,
                // ),
                CustomTextField(
                    labelText: "Password",
                    suffixIcon: value.isObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onTap: value.toggleObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: value.isObscure),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: "Confirm Password",
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
                  hintText: "Please confirm your Password",
                  obscureText: _isConfirmPwVisible,
                  suffixIcon: _isConfirmPwVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onTap: _toggleConfirmPwVisibility,
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
                      style: GoogleFonts.poppins(
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
                        style: GoogleFonts.poppins(
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
