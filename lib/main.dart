import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/data/meal.dart';

import 'package:mealapp/screens/favorite_screen.dart';

import 'models/cateogry_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedTabIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoryScreen(meal: dummyMeals.first, category: availableCategories.first),
        '/favorite': (context) => const FavoriteScreen(),
      },
    );
  }
}
