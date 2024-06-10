import 'package:flutter/material.dart';

import '../models/bottom_bar.dart';
import '../models/drawer.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      drawer: const Draweer(
        title: 'ok',
      ),
      bottomNavigationBar: const BottomNavigationBarExample(),
    );
  }
}
