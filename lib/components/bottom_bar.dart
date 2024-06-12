import 'package:flutter/material.dart';
import 'package:mealapp/models/cateogry_screen.dart';
import 'package:mealapp/screens/favorite_screen.dart';

import '../data/meal.dart';
import 'drawer.dart';

class BottomNavigationBarExample extends StatefulWidget {
  final Meal meal;
  const BottomNavigationBarExample({super.key, required this.meal});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  
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



  @override
  Widget build(BuildContext context) {
    final meal= widget.meal;


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