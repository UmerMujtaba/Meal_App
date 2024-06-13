import 'package:flutter/material.dart';
import 'filter_list_item.dart'; // Adjust the import to the correct path if needed
import '../components/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> titles = ['Gluten-Free', 'Lactose-Free', 'Vegan-Free'];
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(titles.length, false);
  }

  void updateSelected(int index, bool isSelected) {
    setState(() {
      isSelectedList[index] = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isSelectedList);
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black54,
        title: const Text(
          'Customize your search',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: titles.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MyListItems(
                name: titles[index],
                isSelected: isSelectedList[index],
                onSelectedChange: (isSelected) {
                  updateSelected(index, isSelected);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

