import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';

import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';
import '../models/cateogry_screen.dart';
import '../provider/favorite_provider.dart';
import '../provider/meal_provider.dart';


class FavoriteScreen extends ConsumerWidget {
  final Meal meal;
  final Category category;

  const FavoriteScreen({Key? key, required this.meal, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    void toggleFavorite(Meal meal) {
      ref.read(FavoriteProvider as ProviderListenable);
    }
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Your Favorites',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: favoriteMeals.isEmpty
          ? const Center(
        child: Text(
          'You have no favorites yet.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          final meal = favoriteMeals[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
                                      meal.complexity.name.toUpperCase(),
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
          );
        },
      ),
      // drawer:  Draweer(
      //   title: 'ok',
      //     category: widget.category, meal: widget.meal
      // ),

    );
  }
}
