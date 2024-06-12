import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Meal> _items = [];

  List<Meal> get items => _items;

  void add(List item) {
    _items.add(items as Meal);
    notifyListeners();
  }

  void remove(List item) {
    _items.remove(items);
    notifyListeners();
  }

  void removeAll(item) {
    _items.clear();
    notifyListeners();
  }
}
