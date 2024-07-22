import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onTap;

  const MyDrawerTile({super.key, this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(
          title!,
          style: TextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 16,
              letterSpacing: 4,
              fontWeight: FontWeight.normal),
        ),
        leading: Icon(
          icon,
          color: colorScheme.inversePrimary,
          size: 35,
        ),
        onTap: onTap,
      ),
    );
  }
}
