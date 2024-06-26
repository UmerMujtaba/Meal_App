import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';
import '../models/cateogry_screen.dart';
import 'favorite_screen.dart';

class MealScreen extends StatefulWidget {
  final Meal meal;
  final Category category;
  final List<Meal> availableMeals;
  final Map<String, bool> filters;

  const MealScreen({
    super.key,
    required this.meal,
    required this.category,
    required this.availableMeals,
    required this.filters,
  });

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


  late List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();

    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(widget.category.id);
    }).toList();
    // Apply filters to initially display the matched meals
    applyFilters();
  }

  void applyFilters() {
    setState(() {
      displayedMeals = widget.availableMeals.where((meal) {

        bool categoryMatch = meal.categories.contains(widget.category.id);


        if (!categoryMatch) {
          return false;
        }

        // Check if the meal matches all applied filters
        bool filterMatch = (widget.filters['isGlutenFree'] == meal.isGlutenFree) &&
            (widget.filters['isVegan'] == meal.isVegan) &&
            (widget.filters['isVegetarian'] == meal.isVegetarian) &&
            (widget.filters['isLactoseFree'] == meal.isLactoseFree);

        // Debugging: Print filter match information
        if (!filterMatch) {
          print('Meal ${meal.id} matches filters');
        }

        // Return true if both categoryMatch and filterMatch are true
        return categoryMatch && filterMatch;
      }).toList();

      // Debugging: Print displayed meals
      print('Displayed Meals: ${displayedMeals.map((meal) => meal.id).toList()}');
    });
  }
  //print(widget.filters);

  @override
  Widget build(BuildContext context) {
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
      body: displayedMeals.isEmpty
          ? const Center(
              child: Text(
                'No meals available.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: displayedMeals.length,
              itemBuilder: (ctx, index) {
                final meal = displayedMeals[index];
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
                          category: widget.category,
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
      // drawer:
      // Draweer(title: 'ok', category: widget.category, meal: widget.meal),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.cyan,
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
        ],
        currentIndex: 0, // Assume current screen is MealScreen

        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                        meal: widget.meal,
                        category: widget.category,
                        filters: widget.filters,
                        availableMeals: widget.availableMeals,
                      )),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FavoriteScreen(
                      meal: widget.meal, category: widget.category)),
            );
          }
        },
      ),
    );
  }
}
