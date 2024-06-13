import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MyListItems extends StatefulWidget {
  final String name;
  final bool isSelected;
  final ValueChanged<bool> onSelectedChange;

  const MyListItems({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onSelectedChange,
  }) : super(key: key);

  @override
  State<MyListItems> createState() => _MyListItemsState();
}

class _MyListItemsState extends State<MyListItems> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = value;
    });
    widget.onSelectedChange(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.name}  $isSelected'); // Just to check whether names and corresponding state is saved or not

    return ListTile(
      tileColor: isSelected ? Colors.brown : Colors.black54,
      title: Text(
        widget.name,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      subtitle: Text(
        isSelected ? "Selected" : 'Not Selected',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      trailing: Switch(
        onChanged: toggleSwitch,
        value: isSelected,
        activeColor: Colors.blue,
      ),
    );
  }
}
