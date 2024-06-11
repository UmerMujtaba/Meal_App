import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';
import '../../models/meal.dart';
import '../italian_screen.dart';

class ItalianDetailScreen extends StatefulWidget {
  const ItalianDetailScreen({Key? key}) : super(key: key);

  @override
  State<ItalianDetailScreen> createState() => _ItalianDetailScreenState();
}

class _ItalianDetailScreenState extends State<ItalianDetailScreen> {
  Meal? meal;

  @override
  void initState() {
    super.initState();

    final italianMeals = dummyMeals.where((meal) {
      return meal.categories.contains('c1') || meal.categories.contains('c2');
    }).toList();

    if (italianMeals.isNotEmpty) {
      meal = italianMeals[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54
      ,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: Text(
          meal!.title,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.star_border, size: 26,color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network("https://images.pexels.com/photos/7218637/pexels-photo-7218637.jpeg",
              width: double.infinity,
              height: 400,
              fit: BoxFit.fill,
            ),

            SizedBox(height: 10),
            Text('Ingredients', style: TextStyle(
              color: Colors.brown[300],
              fontSize: 26,

            ),)
          ],
        ),
      ),
    );
  }
}
