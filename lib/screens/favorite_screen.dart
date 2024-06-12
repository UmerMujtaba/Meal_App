import 'package:flutter/material.dart';

import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../data/meal.dart';

class FavoriteScreen extends StatefulWidget {
  // final Meal selected;
  // required this.meal
  //  required this.selected
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // final meal=widget.meal;
// final check=widget.selected;
// print(check);
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: const Column(
        children: [
          Text(
            'c',
            style: TextStyle(color: Colors.white, fontSize: 28),
          )
        ],
      ),
      drawer: const Draweer(
        title: 'ok',
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
