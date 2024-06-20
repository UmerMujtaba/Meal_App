import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../data/category.dart' as app;
import '../data/dummy_data.dart';
import '../data/meal.dart';

import '../provider/meal_provider.dart';
import '../screens/meal_screen.dart';
import 'category_item.dart';

class CategoryScreen extends ConsumerWidget {
  final Meal meal;
  final app.Category category;

  const CategoryScreen({
    Key? key,
    required this.meal,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    print(favoriteMeals);
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
        padding: const EdgeInsets.all(10.0),
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
                  builder: (context) => MealScreen(category: category, meal),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Draweer(
          title: 'Drawer Example',

          meal: meal, category: category,
          //category: null,
        ),
      ),
    );
  }
}
