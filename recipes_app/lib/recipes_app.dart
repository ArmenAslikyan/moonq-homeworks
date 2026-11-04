import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/recipes_app_screen.dart';

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Իմ խոհարարական գիրքը',
      debugShowCheckedModeBanner: false,
      home: RecipesAppScreen()
    );
  }
}