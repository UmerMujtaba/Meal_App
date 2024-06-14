import 'package:flutter/material.dart';
import 'package:mealapp/data/category.dart';
import '../../data/meal.dart';
import '../components/drawer.dart';



List<Meal> favoriteMeals = [];
class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  final Function(Meal) onToggleFavorite;
  final bool isFavorite;
  final Category category;
  const MealDetailScreen({
    Key? key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
    required this.category,
  }) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: Text(
          meal.title,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
                widget.onToggleFavorite(meal);
              });
            },
            icon: Icon(
              isSelected ? Icons.favorite : Icons.favorite_border,
              color: isSelected ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.orange[500],
                fontSize: 26,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: meal.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      meal.ingredients[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Steps',
              style: TextStyle(
                color: Colors.orange[500],
                fontSize: 26,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: meal.steps.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      meal.steps[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // drawer:
      // Draweer(title: 'ok', category: widget.category, meal: widget.meal, ),
    );
  }
}
