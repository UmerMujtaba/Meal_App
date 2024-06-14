import 'package:flutter/material.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';
import '../filter/filter_screen.dart';
import '../models/cateogry_screen.dart';
//ust import as per your project structure

class Draweer extends StatefulWidget {
  final String title;
  final Meal meal;
  final Category category;

  const Draweer({
    Key? key,
    required this.title,
    required this.meal,
    required this.category,
  }) : super(key: key);

  @override
  State<Draweer> createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> {
  Map<String, bool> filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };

  void updateFilters(Map<String, bool> selectedFilters) {
    setState(() {
      filters = selectedFilters;
    });
  }

  void _navigateToFilterScreen() async {
    final selectedFilters = await Navigator.push<Map<String, bool>>(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(
          filters: filters,
          updateFilters: updateFilters, meal: widget.meal, category: widget.category,
        ),
      ),
    );

    if (selectedFilters != null) {
      updateFilters(selectedFilters);
      print(filters);
    }
  }



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
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
                leading: const Icon(Icons.restaurant, size: 30, color: Colors.white),
                title: const Text(
                  'Meals',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        availableMeals: dummyMeals,
                        filters: filters, meal: widget.meal, category: widget.category,
                      ),
                    ),
                  );
                },
              ),
              const Divider(height: 2, color: Colors.black),
              ListTile(
                leading: const Icon(Icons.settings, size: 30, color: Colors.white),
                title: const Text(
                  'Filters',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  _navigateToFilterScreen();
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
