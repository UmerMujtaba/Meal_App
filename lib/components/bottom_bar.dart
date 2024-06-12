import 'package:flutter/material.dart';
import 'package:mealapp/screens/favorite_screen.dart';

import '../data/meal.dart';


class BottomBar extends StatefulWidget {
  // final Meal check;
  // required this.meal
  const BottomBar({super.key,});

  @override
  State<BottomBar> createState() =>
      _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
bool isSelected=false;

  int _selectedTabIndex = 0;
  void _onTabTapped(int index) async {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    }
    if (index == 1) {
      // Navigator.of(context).push(
      //     MaterialPageRoute(
      //         builder: (context) => FavoriteScreen()));
    }
    setState(() {
      _selectedTabIndex = index;
    });
  }



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