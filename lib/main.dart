import 'package:flutter/material.dart';
import 'package:mealapp/components/drawer_list_item.dart';
import 'data/dummy_data.dart';
import 'data/meal.dart';

import 'models/cateogry_screen.dart';
import 'screens/favorite_screen.dart';

void main() {
  // Initialize a dummy meal for demonstration purposes
  final Meal meal = dummyMeals.first;
  runApp(MyApp(meal: meal));
}

class MyApp extends StatefulWidget {
  final Meal meal;
  const MyApp({super.key, required this.meal});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return MaterialApp(
      home: HomeScreen(meal: meal),
    );
  }
}
