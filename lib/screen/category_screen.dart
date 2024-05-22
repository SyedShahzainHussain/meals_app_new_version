import 'package:flutter/material.dart';
import 'package:meals_app/view_model/category_view_model.dart';
import 'package:meals_app/widget/category_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late CategoryViewModel categoryViewModel;

  @override
  void initState() {
    super.initState();
    categoryViewModel = CategoryViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => categoryViewModel,
        child: Consumer<CategoryViewModel>(builder: (context, value, _) {
          return GridView.builder(
            padding: const EdgeInsets.all(15.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return CategoryWidget(
                category: value.category[index],
              );
            },
            itemCount: value.category.length,
          );
        }),
      ),
    );
  }
}
