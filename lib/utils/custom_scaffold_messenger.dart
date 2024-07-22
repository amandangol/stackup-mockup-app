// utils/custom_scaffold_messenger.dart
import 'package:flutter/material.dart';

class CustomScaffoldMessenger {
  static void showSnackBar(BuildContext context, String message,
      VoidCallback? onPressed, String? label,
      {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: label!,
          textColor: Colors.yellow,
          onPressed: onPressed!,
        ),
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
