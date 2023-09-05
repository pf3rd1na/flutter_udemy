import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';

final kDefaultFilters = {
  FilterSwichType.glutenFree: false,
  FilterSwichType.lactoseFree: false,
  FilterSwichType.vegetarian: false,
  FilterSwichType.vegan: false,
};

enum FilterSwichType {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<FilterSwichType, bool>> {
  FiltersNotifier() : super(kDefaultFilters);

  void setFilters(Map<FilterSwichType, bool> filters) {
    state = filters;
  }

  void toggleFilter(FilterSwichType filterType, bool isActive) {
    state = {
      ...state,
      filterType: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<FilterSwichType, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final filters = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);

  return meals.where((meal) {
    if (filters[FilterSwichType.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[FilterSwichType.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[FilterSwichType.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filters[FilterSwichType.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
