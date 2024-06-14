import 'package:flutter/material.dart';
import '../data/category.dart';
import '../data/meal.dart';
// Adjust import as per your project structure
import 'filter_list_item.dart'; // Adjust the import to the correct path if needed

class FilterScreen extends StatefulWidget {
  final Meal meal;
  final Category category;
  // final List<bool> isSelectedList;
  // final Function(List<bool>) updateSelected;
  final Map<String, bool> filters;
  final Function(Map<String, bool>) updateFilters;

   FilterScreen({
    Key? key,
    required this.meal,
    required this.category,
     required this.filters,
     required this.updateFilters,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, bool> filters;

  @override
  void initState() {
    super.initState();
    filters = Map.from(widget.filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Your Filters',style: TextStyle(
            color: Colors.white,fontSize: 22
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, filters);

          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Gluten-Free', style: TextStyle(
              color: Colors.white,fontSize: 22
            ),),
            value: filters['isGlutenFree'] ?? false,
            onChanged: (newValue) {
              setState(() {
                filters['isGlutenFree'] = newValue;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Vegan', style: TextStyle(
                color: Colors.white,fontSize: 22
            ),),
            value: filters['isVegan'] ?? false,
            onChanged: (newValue) {
              setState(() {
                filters['isVegan'] = newValue;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Vegetarian', style: TextStyle(
                color: Colors.white,fontSize: 22
            ),),
            value: filters['isVegetarian'] ?? false,
            onChanged: (newValue) {
              setState(() {
                filters['isVegetarian'] = newValue;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Lactose-Free', style: TextStyle(
                color: Colors.white,fontSize: 22
            ),),
            value: filters['isLactoseFree'] ?? false,
            onChanged: (newValue) {
              setState(() {
                filters['isLactoseFree'] = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
