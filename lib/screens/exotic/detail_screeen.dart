import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../data/meal.dart';

class ExoticDetailScreen extends StatefulWidget {
  const ExoticDetailScreen({Key? key}) : super(key: key);

  @override
  State<ExoticDetailScreen> createState() => _ExoticDetailScreenState();
}

class _ExoticDetailScreenState extends State<ExoticDetailScreen> {
  Meal? meal;

  @override
  void initState() {
    super.initState();

    final italianMeals = dummyMeals.where((meal) {
      return meal.categories.contains('c6');
    }).toList();

    if (italianMeals.isNotEmpty) {
      meal = italianMeals[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: Text(
          meal!.title,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {

              });
            },
            icon: const Icon(
              Icons.star_border,
              size: 26,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              meal!.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.brown[300],
                fontSize: 26,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal!.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  // Reduce space between tiles
                  child: ListTile(
                    dense: true,
                    title: Text(
                      meal!.ingredients[index],
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
                color: Colors.brown[300],
                fontSize: 26,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal!.steps.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  // Reduce space between tiles
                  child: ListTile(
                    dense: true,
                    title: Text(
                      meal!.steps[index],
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
    );
  }
}
