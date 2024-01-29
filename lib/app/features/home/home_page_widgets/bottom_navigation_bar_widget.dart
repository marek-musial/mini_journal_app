import 'package:flutter/material.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Mood today',
          icon: Icon(Icons.add),
          activeIcon: Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          label: 'Graph',
          icon: Icon(Icons.auto_graph),
          activeIcon: Icon(Icons.auto_graph),
        ),
        BottomNavigationBarItem(
          label: 'Summary',
          icon: Icon(Icons.calendar_month),
          activeIcon: Icon(Icons.calendar_month),
        ),
      ],
      backgroundColor: currentColorScheme.primaryContainer,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      iconSize: screenHeight / 32,
      selectedFontSize: screenHeight / 48,
      unselectedFontSize: screenHeight / 48,
      onTap: _onItemTapped,
    );
  }
}
