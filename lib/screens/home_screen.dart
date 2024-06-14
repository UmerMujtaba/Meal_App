import 'package:flutter/material.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';
import '../models/cateogry_screen.dart';
import 'favorite_screen.dart';
import 'meal_screen.dart';
import 'meal_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Using the first meal and category as examples
  final Meal _sampleMeal = dummyMeals[0];
  final Category _sampleCategory = availableCategories[0];

  // Handle favorite toggling
  bool _isFavorite = false;

  List<bool> _isSelectedList = []; // Hold selected filters

  void _updateSelectedList(List<bool> selectedList) {
    setState(() {
      _isSelectedList = selectedList;
    });
  }

  // List of screens with required data passed
  List<Widget> _widgetOptions() {
    return <Widget>[
      CategoryScreen(meal: _sampleMeal, category: _sampleCategory, availableMeals: [], filters: {},),
      FavoriteScreen(meal: _sampleMeal, category: _sampleCategory),
      // MealScreen(category: _sampleCategory, mealss: _sampleMeal),
      // MealDetailScreen(
      //   meal: _sampleMeal,
      //   onToggleFavorite: _toggleFavorite,
      //   isFavorite: _isFavorite,
      //   category: _sampleCategory,
      // ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _widgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.fastfood),
          //   label: 'Meals',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.info),
          //   label: 'Details',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }
}
