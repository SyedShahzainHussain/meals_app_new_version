import 'package:flutter/material.dart';
import 'package:meals_app/view_model/category_view_model.dart';
import 'package:meals_app/widget/category_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late CategoryViewModel categoryViewModel;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    categoryViewModel = CategoryViewModel();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.forward();
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
              return AnimatedBuilder(
                  animation: _animationController,
                  child: CategoryWidget(
                    category: value.category[index],
                  ),
                  builder: (context, child) {
                    return SlideTransition(
                      position:
                          Tween(begin: const Offset(0, 0.5), end: Offset.zero)
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.decelerate)),
                      child: child,
                    );
                  });
            },
            itemCount: value.category.length,
          );
        }),
      ),
    );
  }
}
