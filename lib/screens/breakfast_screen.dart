import 'package:flutter/material.dart';

class BreakfastScreen extends StatelessWidget {
  const BreakfastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Breakfast',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
