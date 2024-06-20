import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/category.dart';
import '../data/dummy_data.dart';
import '../data/meal.dart';

final availableMealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});
final sampleMealProvider = Provider<Meal>((ref) => dummyMeals[0]);

// Provider for the sample category
final sampleCategoryProvider = Provider<Category>((ref) => availableCategories[0]);

// StateProvider for managing the selected index
final selectedIndexProvider = StateProvider<int>((ref) => 0);


final filtersProvider =
StateNotifierProvider<FiltersNotifier, Map<String, bool>>((ref) {
  return FiltersNotifier();
});

class FiltersNotifier extends StateNotifier<Map<String, bool>> {
  FiltersNotifier()
      : super({
          'isGlutenFree': false,
          'isVegan': false,
          'isVegetarian': false,
          'isLactoseFree': false,
        });

  void updateFilter(String key, bool value) {
    state = {...state, key: value};
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleFavorite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final filteredMealsProvider =
    Provider.family<List<Meal>, Category>((ref, category) {
  final availableMeals = ref.watch(availableMealsProvider);
  final filters = ref.watch(filtersProvider);
  return availableMeals.where((meal) {
    bool categoryMatch = meal.categories.contains(category.id);

    if (!categoryMatch) {
      return false;
    }

// Check if the meal matches all applied filters
    bool filterMatch = (filters['isGlutenFree'] == meal.isGlutenFree) &&
        (filters['isVegan'] == meal.isVegan) &&
        (filters['isVegetarian'] == meal.isVegetarian) &&
        (filters['isLactoseFree'] == meal.isLactoseFree);

// Debugging: Print filter match information
    if (!filterMatch) {
      print('Meal ${meal.id} matches filters');
    }

// Return true if both categoryMatch and filterMatch are true
    print('Displayed Meals: ${availableMeals.map((meal) => meal.id).toList()}');
    return categoryMatch && filterMatch;
  }).toList();

// Debugging: Print displayed meals
});
