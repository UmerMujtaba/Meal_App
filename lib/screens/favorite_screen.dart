import 'package:flutter/material.dart';
import '../../data/meal.dart';
import '../components/drawer.dart';
List<Meal> favoriteMeals = [];
class FavoriteScreen extends StatelessWidget {

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('oakfs',style: TextStyle(color: Colors.white,fontSize: 23),),
          )
        ],
      ),
      drawer: const Draweer(
      title: 'ok',
    ),
    );
  }
} 
