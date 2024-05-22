import 'package:flutter/material.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/view_model/filter_view_model.dart';
import 'package:provider/provider.dart';

import '../model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final selectedMeals =
            Provider.of<FilterViewModel>(context, listen: false)
                .filterAvalaibleMeals(context);
        final avalaible = selectedMeals
            .where((element) => element.categories.contains(category.id))
            .toList();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => MealsScreen(
            title: category.title,
            meals: avalaible,
          ),
        ));
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
