import 'package:cars_menu/presentation/cars_menu_screen.dart';
import 'package:flutter/material.dart';

class CarsMenu extends StatelessWidget {
  const CarsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars',
      debugShowCheckedModeBanner: false,
      home: CarsMenuScreen()
    );
  }
}