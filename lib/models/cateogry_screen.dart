import 'package:flutter/material.dart';
import 'package:mealapp/data/category.dart';
import 'package:mealapp/data/meal.dart';
import 'package:mealapp/screens/meal_screen.dart';
import '../components/drawer.dart';
import '../data/dummy_data.dart';

import 'category_item.dart';

class CategoryScreen extends StatefulWidget {
  final Meal meal;
final Category category;

  const CategoryScreen({Key? key, required this.meal, required this.category, }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final category = widget.category;
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
          scrollDirection: Axis.vertical,
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
                  builder: (context) => MealScreen(category: category, mealss: widget.meal),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Draweer(title: 'ok', category: widget.category, meal: widget.meal),
    );
  }
}
