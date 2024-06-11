import 'package:flutter/material.dart';
import 'package:mealapp/screens/quick/detail_screen.dart';
import '../models/bottom_bar.dart';
import '../models/drawer.dart';
import '../models/dummy_data.dart';
import '../models/meal.dart';

class QuickScreen extends StatefulWidget {
  const QuickScreen({Key? key}) : super(key: key);

  @override
  State<QuickScreen> createState() => _QuickScreenState();
}

class _QuickScreenState extends State<QuickScreen> {

  List<Meal> mealsHavingC2 = [];
  @override
  void initState() {
    super.initState();

    mealsHavingC2 = dummyMeals.where((meal) {
      return meal.categories.contains('c2');
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Quick Screen',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: mealsHavingC2.isEmpty
          ? const Center(
        child: Text(
          'No Italian meals available.',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: mealsHavingC2.length,
        padding: const EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      final meal = mealsHavingC2[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const QuickDetailScreen(),// meal: meal
                            ),
                          );
                        },
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
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
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
                                                      fontWeight: FontWeight
                                                          .w500),
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
                                                      fontWeight: FontWeight
                                                          .w500),
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
                                                      fontWeight: FontWeight
                                                          .w500),
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
      drawer: const Draweer(
        title: 'ok',
      ),
      bottomNavigationBar: const BottomNavigationBarExample(),
    );
  }
}
