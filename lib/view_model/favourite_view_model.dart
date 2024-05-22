import 'package:flutter/material.dart';
import 'package:meals_app/model/meals_model.dart';

class FavouriteViewModel with ChangeNotifier {
  final List<Meal> _favourite = [];
  List<Meal> get favourite => _favourite;

  void addToggleFavourite(Meal meal, BuildContext context) {
    final existingFavourite = _favourite.contains(meal);
    if (existingFavourite) {
      _favourite.remove(meal);
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(const SnackBar(
                    duration: Duration(seconds: 2),
          content: Text("Remove From Favourite"),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
        ));
      notifyListeners();
    } else {
      _favourite.add(meal);
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Add To Favourite"),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
        ));
      notifyListeners();
    }
  }
}
