import 'package:flutter/material.dart';
import 'package:restaurant_menu/ui/restaurant_menu_screen.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantMenuScreen(),
    );
  }
}