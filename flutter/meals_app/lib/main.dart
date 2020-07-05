import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import './screen/category_meal_screen.dart';
import './screen/category_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tab_screen.dart';
import './screen/filter_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    '_isGlutenFree': false,
    "_isLactoseFree": false,
    '_isVegan': false,
    "_isVegetarian": false,
  };

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filter['_isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filter['_isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filter['_isVegan'] && !meal.isVegan) {
          return false;
        }

        if (_filter['_isVegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilter, _filter),
      },
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
      onUnknownRoute: (settings) {
        // used when route not found
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
