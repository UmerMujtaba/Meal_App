import 'package:flutter/material.dart';
import 'package:mealapp/models/cateogry_screen.dart';

import '../data/category.dart';
import '../data/meal.dart';
import '../filter/filter_screen.dart';

class Draweer extends StatefulWidget {
  final Meal meal;
  final Category category;
  const Draweer({super.key, required this.title, required this.meal, required this.category});

  final String title;

  @override
  State<Draweer> createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width *
            0.75, // 75% of screen will be occupied
        child: Drawer(
          backgroundColor: Colors.brown[900],
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.fastfood,
                      size: 26,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Meal App!',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    )
                  ],
                ),
              ),
              ListTile(
                  leading:
                  const Icon(Icons.restaurant, size: 30, color: Colors.white),
                  title: const Text(
                    'Meals',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(meal: widget.meal, category: widget.category)));
                  },
              ),
              const Divider(height: 2, color: Colors.black),
              ListTile(
                leading:
                const Icon(Icons.settings, size: 30, color: Colors.white),
                title: const Text(
                  'Filters',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const FilterScreen()));
                },
              ),
              const Divider(height: 2, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
