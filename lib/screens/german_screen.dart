import 'package:flutter/material.dart';

class GermanScreen extends StatelessWidget {
  const GermanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'German',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
