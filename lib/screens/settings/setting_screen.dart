import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackup_app/themes/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
            decoration: BoxDecoration(
                color: colorScheme.tertiary,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                      color: colorScheme.inversePrimary, fontSize: 16),
                ),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
