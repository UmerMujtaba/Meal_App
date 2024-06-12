import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_screen.dart';
import '../components/bottom_bar.dart';
import '../data/category.dart';
import '../components/drawer.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';
import 'category_item.dart';
import '../filter/filter_list_item.dart';
import '../filter/filter_screen.dart';
class CategoryScreen extends StatefulWidget {

  final Meal meal;
  const CategoryScreen({Key? key, required this.meal}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      {'id': 'c1', 'title': 'Italian'},
      {'id': 'c2', 'title': 'Quick & Easy'},
      {'id': 'c3', 'title': 'Hamburgers'},
      {'id': 'c4', 'title': 'German'},
      {'id': 'c5', 'title': 'Light& Lovely'},
      {'id': 'c6', 'title': 'Exotic'},
      {'id': 'c7', 'title': 'Breakfast'},
      {'id': 'c8', 'title': 'Asian'},
      {'id': 'c9', 'title': 'French'},
      {'id': 'c10', 'title': 'Summer'},
    ];
    final meal= widget.meal;
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
              mainAxisExtent: 120),
          itemBuilder: (BuildContext context, int index) {
            final category = availableCategories[index];
            return CategoryItem(
              category,
              onPressed: () =>  Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MealScreen(category: category, meal: meal,),
            ),
            ),
            );
          },
        ),
      ),
      drawer: const Draweer(
        title: 'ok',
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
