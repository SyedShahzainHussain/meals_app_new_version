import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/tabs/tabs.dart';
import 'package:provider/provider.dart';

import 'view_model/favourite_view_model.dart';
import 'view_model/filter_view_model.dart';
import 'view_model/meal_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteViewModel()),
        ChangeNotifierProvider(create: (context) => MealViewModel()),
        ChangeNotifierProvider(create: (context) => FilterViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meals App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 131, 57, 0),
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.latoTextTheme(),
          useMaterial3: true,
        ),
        home: const TabScreen(),
      ),
    );
  }
}
