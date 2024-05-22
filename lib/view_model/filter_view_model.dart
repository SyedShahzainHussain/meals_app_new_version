import 'package:flutter/material.dart';
import 'package:meals_app/view_model/meal_view_model.dart';
import 'package:provider/provider.dart';

import '../model/meals_model.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterViewModel with ChangeNotifier {
  bool _glutenFreeFilter = false;
  bool _locatoseFreeFilter = false;
  bool _vegetarianFreeFilter = false;
  bool _veganFreeFilter = false;

  Map<Filter, bool> get seletecFilter {
    return {
      Filter.glutenFree: _glutenFreeFilter,
      Filter.lactoseFree: _locatoseFreeFilter,
      Filter.vegetarian: _vegetarianFreeFilter,
      Filter.vegan: _veganFreeFilter,
    };
  }

  setGlutenFreeFilter(bool value) {
    _glutenFreeFilter = value;
    notifyListeners();
  }

  setlactoseFreeFilter(bool value) {
    _locatoseFreeFilter = value;
    notifyListeners();
  }

  setVegetarianFreeFilter(bool value) {
    _vegetarianFreeFilter = value;
    notifyListeners();
  }

  setVeganFreeFilter(bool value) {
    _veganFreeFilter = value;
    notifyListeners();
  }

  List<Meal> filterAvalaibleMeals(BuildContext context) {
    final data =
        Provider.of<MealViewModel>(context, listen: false).meals.where((meal) {
      if (seletecFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (seletecFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (seletecFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (seletecFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    return data;
  }
}
