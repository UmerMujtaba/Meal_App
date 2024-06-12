import 'package:flutter/material.dart';

class MyListItems extends StatefulWidget {
  final String title;

  const MyListItems({Key? key, required this.title}) : super(key: key);

  @override
  State<MyListItems> createState() => _MyListItemsState();
}

class _MyListItemsState extends State<MyListItems> {
  bool isSelected = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final <List>name;
    return ListTile(
      tileColor: isSelected ? Colors.brown : Colors.black54,
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white,fontSize: 20),
      ),
      subtitle: Text(
        isSelected ? "Selected" : 'Not Selected',
        style: const TextStyle(color: Colors.white,fontSize: 12),
      ),
      trailing: Switch(
        onChanged: toggleSwitch,
        value: isSelected,
        activeColor: Colors.blue,
      ),
    );
  }
}
