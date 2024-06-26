import 'package:flutter/material.dart';
import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';

import '../screens/meal_screen.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  final Meal meal;
  final Category category;
  final Map<String, bool> filters;
  final List<Meal> availableMeals;

  const CategoryScreen({
    Key? key,
    required this.meal,
    required this.category,
    required this.filters,
    required this.availableMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(filters);
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Category',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: availableCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 15.0,
            mainAxisExtent: 120,
          ),
          itemBuilder: (BuildContext context, int index) {
            final category = availableCategories[index];
            return CategoryItem(
              category,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MealScreen(
                    category: category,
                    meal: meal,
                    availableMeals: availableMeals,
                    filters: filters,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Draweer(
          title: 'Drawer Example',
          category: category,
          meal: meal,
        ),
      ),
    );
  }
}
