import 'package:flutter/material.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/view_model/favourite_view_model.dart';
import 'package:meals_app/view_model/tabs_view_model.dart';
import 'package:provider/provider.dart';

import '../widget/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late TabViewModel tabViewModel;
  @override
  void initState() {
    super.initState();
    tabViewModel = TabViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => tabViewModel,
      child: Consumer<TabViewModel>(
        builder: (context, data, _) {
          List<Widget> pages = [
            const CategoryScreen(),
            Consumer<FavouriteViewModel>(
              builder: (context, favouriteViewModel, _) {
                return MealsScreen(meals: favouriteViewModel.favourite,title: null,);
              },
            ),
          ];
          return Scaffold(
            drawer: const DrawerWidget(),
            appBar: AppBar(
                title: data.currentIndex == 0
                    ? const Text("Pick your category")
                    : const Text("Favourite")),
            body: pages[data.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => data.setCurrentIndex(index),
              currentIndex: data.currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.set_meal), label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star), label: "Favorites"),
              ],
            ),
          );
        },
      ),
    );
  }
}
