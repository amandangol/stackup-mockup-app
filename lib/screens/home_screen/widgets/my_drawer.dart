import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/home_screen/widgets/my_drawer_tile.dart';
import 'package:stackup_app/screens/authscreens/login_screen/login_screen.dart';
import 'package:stackup_app/screens/settings/setting_screen.dart';
import 'package:stackup_app/services/auth/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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

  bool _isBalanceVisible = false;

  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: colorScheme.secondary,
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: _isBalanceVisible
                  ? Text(
                      '\$5', // Replace with your actual balance
                      style: GoogleFonts.poppins(
                          color: colorScheme.inversePrimary,
                          fontSize: 18,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Balance Hidden", // Placeholder when balance is hidden
                      style: TextStyle(
                          color: colorScheme.inversePrimary,
                          fontSize: 16,
                          letterSpacing: 2,
                          fontWeight: FontWeight.normal),
                    ),
              leading: FaIcon(
                FontAwesomeIcons.wallet,
                color: colorScheme.inversePrimary,
                size: 25,
              ),
              trailing: IconButton(
                icon: _isBalanceVisible
                    ? FaIcon(
                        FontAwesomeIcons.eyeSlash,
                        color: colorScheme.inversePrimary,
                        size: 25,
                      )
                    : FaIcon(
                        FontAwesomeIcons.eye,
                        color: colorScheme.inversePrimary,
                        size: 25,
                      ),
                onPressed: _toggleBalanceVisibility,
              ),
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _launchURL("https://discord.gg/3x3h2z6A63");
                },
                icon: const FaIcon(
                  FontAwesomeIcons.discord,
                  color: Color.fromARGB(255, 34, 17, 37),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL("https://stackup.dev/");
                },
                child: Image.asset(
                  "images/stackup.jpeg",
                  height: 20,
                  width: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  _launchURL("https://twitter.com/StackUpHQ");
                },
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     _launchURL("https://www.facebook.com/StackUpHQ");
              //   },
              //   icon: const FaIcon(
              //     FontAwesomeIcons.facebook,
              //     color: Colors.blue,
              //   ),
              // ),
              IconButton(
                onPressed: () {
                  _launchURL(
                      "https://www.linkedin.com/company/stackupofficial/");
                },
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
