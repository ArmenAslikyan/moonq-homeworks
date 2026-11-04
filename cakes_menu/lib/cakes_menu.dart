import 'package:cakes_menu/ui/cakes_menu_screen.dart';
import 'package:flutter/material.dart';

class CakesMenu extends StatelessWidget {
  const CakesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cakes Menu',
      debugShowCheckedModeBanner: false,
      home: CakesMenuScreen()
    );
  }
}