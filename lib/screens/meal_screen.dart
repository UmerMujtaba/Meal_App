import 'package:flutter/material.dart';

import 'package:mealapp/screens/meal_detail_screen.dart';
import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';

class MealScreen extends StatefulWidget {
  final Meal mealss;
  final Category category;

  const MealScreen({super.key, required this.category, required this.mealss});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  void toggleFavorite(Meal meal) {
    setState(() {
      if (favoriteMeals.contains(meal)) {
        favoriteMeals.remove(meal);
      } else {
        favoriteMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = dummyMeals.where((meals) {
      return meals.categories.contains(widget.category.id);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: Text(
          widget.category.title,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: meals.isEmpty
          ? const Center(
              child: Text(
                'No meals available.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                final meal = meals[index];
                final isFavorite = favoriteMeals.contains(meal);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MealDetailScreen(
                          meal: meal,
                          onToggleFavorite: toggleFavorite,
                          isFavorite: isFavorite,
                        ),
                      ),
                    ),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.white,
                      color: Colors.greenAccent[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SizedBox(
                        height: 250,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                meal.imageUrl,
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return const Center(
                                    child: Icon(Icons.restaurant),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      meal.title,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '${meal.duration} min',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Icon(
                                              Icons.cases_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              meal.complexity.name
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const Icon(
                                              Icons.attach_money_rounded,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              meal.affordability.name
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      drawer:
          Draweer(title: 'ok', category: widget.category, meal: widget.mealss),
      //bottomNavigationBar: BottomBar(),
    );
  }
}
