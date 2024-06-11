import 'package:flutter/material.dart';
import 'package:mealapp/cateogry_screen.dart';
import '../screens/favorites_screen.dart';
import 'drawer.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {

  int _selectedTabIndex = 0;
  void _onTabTapped(int index) async {
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/first');
    }
    setState(() {
      _selectedTabIndex = index;
    });
  }

  int currentTab = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const FirstScreen(),
    const Draweer(title: 'ok'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          //elevation: 5,
          iconSize: 24,
          selectedIconTheme:
              const IconThemeData(color: Colors.blueAccent, size: 28),
          selectedItemColor: Colors.blueAccent,
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          unselectedItemColor: Colors.white,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedTabIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
