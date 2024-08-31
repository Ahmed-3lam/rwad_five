import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> navIconList() => [
        _navIcon(Icons.home, 0),
        _navIcon(Icons.person, 1),
        _navIcon(Icons.settings, 2),
      ];

  final List<Widget> _screens = [
    HomeScreen(),
    Container(
      child: Center(
        child: Text(
          "Profile",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "Setting",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _navIcon(
    IconData icon,
    int index,
  ) {
    return InkWell(
      onTap: () {
        selectedIndex = index;
        setState(() {});
      },
      child: Icon(
        icon,
        size: 30,
        color: selectedIndex == index ? Colors.blue : Colors.white,
      ),
    );
  }
}

/// Bottom Nav widget
/// Custom nav widget
/// Package
