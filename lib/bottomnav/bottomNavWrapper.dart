import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stackup_app/screens/leaderboard/leaderboard_screen.dart';
import 'package:stackup_app/screens/my_earnings/earning_screen.dart';
import 'package:stackup_app/screens/home_screen/home_screen.dart';
import 'package:stackup_app/screens/myprogress_screen/myprogress_screen.dart';
import 'package:stackup_app/screens/profile_screen/profile_screen.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({super.key});

  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyprogressScreen(),
    const EarningsScreen(),
    const LeaderboardScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // Provider.of<UserProvider>(context, listen: false).loadUsername();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colorScheme.secondary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: colorScheme.inversePrimary,
          unselectedItemColor: colorScheme.primary,
          selectedLabelStyle: TextStyle(color: colorScheme.inversePrimary),
          unselectedLabelStyle: TextStyle(color: colorScheme.primary),
          type: BottomNavigationBarType.fixed,
          items: [
            _buildBottomNavItem(FontAwesomeIcons.home, 'Home'),
            _buildBottomNavItem(FontAwesomeIcons.barsProgress, 'Progress'),
            _buildBottomNavItem(FontAwesomeIcons.dollarSign, 'Earnings'),
            _buildBottomNavItem(FontAwesomeIcons.rankingStar, 'Leaderboard'),
            _buildBottomNavItem(FontAwesomeIcons.userAstronaut, 'Profile'),
          ],
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: FaIcon(icon),
      activeIcon:
          FaIcon(icon, color: Theme.of(context).colorScheme.inversePrimary),
      label: label,
    );
  }
}
