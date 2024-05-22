import 'package:flutter/material.dart';
import 'package:meals_app/model/meals_model.dart';

import '../widget/meals_widget.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  const MealsScreen({super.key, this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: title == null
            ? null
            : AppBar(
                automaticallyImplyLeading: true,
                title: Text(title!),
              ),
        body: meals.isEmpty
            ? Center(
                child: Text(
                  "Uh oh ... nothing here!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealWidget(meals: meals[index]);
                },
                itemCount: meals.length,
              ));
  }
}
