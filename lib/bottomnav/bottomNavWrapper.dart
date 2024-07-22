// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:stackup_app/screens/my_earnings/earning_screen.dart';
import 'package:stackup_app/screens/home_screen/home_screen.dart';
import 'package:stackup_app/screens/myprogress_screen/myprogress_screen.dart';
import 'package:stackup_app/screens/profile_screen/profile_screen.dart';

class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MyprogressScreen(),
    const EarningsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          selectedLabelStyle: TextStyle(color: colorScheme.secondary),
          unselectedItemColor: colorScheme.secondary,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: colorScheme.primary,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.leaderboard,
                color: colorScheme.primary,
              ),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: colorScheme.primary,
              ),
              label: 'Balance',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: colorScheme.primary,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
