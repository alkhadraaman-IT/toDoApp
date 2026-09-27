import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int selectedIndex = 0;
  List listView = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.verified_user_outlined, color: Colors.white),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: "Home",
          ),
        ],
      ),
      body: listView[selectedIndex],
    );
  }
}
