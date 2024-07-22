import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/home_screen/widgets/my_drawer_tile.dart';
import 'package:stackup_app/screens/authscreens/login_screen/login_screen.dart';
import 'package:stackup_app/screens/settings/setting_screen.dart';
import 'package:stackup_app/services/auth/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() async {
    final authService = AuthService();
    await authService.signOut();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Image.asset(
              'images/stackup_logo.png',
              // height: 150,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: colorScheme.secondary,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(
            height: 20,
          ),
          MyDrawerTile(
            title: "HOME",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyDrawerTile(
            title: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
          ),
          MyDrawerTile(
            title: "HELP CENTER",
            icon: FontAwesomeIcons.questionCircle,
            onTap: () {
              // Navigator.pop(context);
              _launchURL("https://stackuphelpcentre.zendesk.com/hc/en-us");
            },
          ),
          MyDrawerTile(
            title: "TERMS OF SERVICES",
            icon: FontAwesomeIcons.fileShield,
            onTap: () {
              // Navigator.pop(context);
              _launchURL("https://stackup.dev/earn/terms/");
            },
          ),
          MyDrawerTile(
            title: "PRIVACY POLICY",
            icon: FontAwesomeIcons.userShield,
            onTap: () {
              // Navigator.pop(context);
              _launchURL("https://stackup.dev/privacy/");
            },
          ),
          const Spacer(),
          MyDrawerTile(
            title: "LOGOUT",
            icon: Icons.logout,
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    title: Text(
                      "Logout",
                      style: GoogleFonts.poppins(),
                    ),
                    content: Text(
                      "Are you sure you want to logout?",
                      style: GoogleFonts.poppins(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          logout();
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        onTap: () {},
                                      )));
                        },
                        child: Text(
                          "Yes",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
