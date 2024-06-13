import 'package:flutter/material.dart';
import 'package:mealapp/data/category.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/data/meal.dart';
//import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/screens/favorite_screen.dart';

import 'models/cateogry_screen.dart';

void main() {
  final Meal meal = dummyMeals.first; // Assuming you have dummyMeals defined somewhere
  final Category category=availableCategories.first;
  runApp(MyApp(meal: meal, category: category,));
}

class MyApp extends StatefulWidget {
  final Meal meal;
final Category category;

  const MyApp({Key? key, required this.meal, required this.category}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            CategoryScreen(meal: widget.meal, category: widget.category, ),
            FavoriteScreen(meal: widget.meal, category: widget.category,),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

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
        ),
      ),
    );
  }
}
