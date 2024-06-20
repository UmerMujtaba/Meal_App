import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/category.dart'; // Adjust the import path as per your project structure
import '../data/meal.dart';
import '../provider/meal_provider.dart'; // Adjust the import path as per your project structure

class FilterScreen extends ConsumerWidget {
  final Meal meal;
  final Category category;

  const FilterScreen({
    Key? key,
    required this.meal,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider); // Read filters from the provider

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Your Filters',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            title: const Text(
              'Gluten-Free',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            value: filters['isGlutenFree'] ?? false,
            onChanged: (newValue) {
              ref.read(filtersProvider.notifier).updateFilter('isGlutenFree', newValue);
            },
          ),
          SwitchListTile(
            title: const Text(
              'Vegan',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            value: filters['isVegan'] ?? false,
            onChanged: (newValue) {
              ref.read(filtersProvider.notifier).updateFilter('isVegan', newValue);
            },
          ),
          SwitchListTile(
            title: const Text(
              'Vegetarian',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            value: filters['isVegetarian'] ?? false,
            onChanged: (newValue) {
              ref.read(filtersProvider.notifier).updateFilter('isVegetarian', newValue);
            },
          ),
          SwitchListTile(
            title: const Text(
              'Lactose-Free',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            value: filters['isLactoseFree'] ?? false,
            onChanged: (newValue) {
              ref.read(filtersProvider.notifier).updateFilter('isLactoseFree', newValue);
            },
          ),
        ],
      ),
    );
  }
}
