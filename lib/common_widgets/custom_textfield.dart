import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final String? labelText;
  final IconData? prefixIcon;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.onTap,
    this.labelText,
    required this.validator,
    this.prefixIcon,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        textInputAction: textInputAction,
        autofocus: false,
        obscureText: obscureText!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.secondary,
            labelText: labelText,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: onTap,
            ),
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            hintStyle: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.inversePrimary,
                letterSpacing: 0.5)),
      ),
    );
  }
}
