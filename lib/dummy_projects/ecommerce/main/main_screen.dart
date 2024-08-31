import 'package:flutter/material.dart';

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
    Container(
      child: Center(
        child: Text(
          "Home",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    ),
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
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navIconList(),
        ),
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
