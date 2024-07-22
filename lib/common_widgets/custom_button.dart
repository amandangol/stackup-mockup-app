import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ),
    );
  }
}
