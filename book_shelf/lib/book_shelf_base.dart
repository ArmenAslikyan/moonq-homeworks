import 'package:book_shelf/presentation/book_shelf_home_screen.dart';
import 'package:flutter/material.dart';

class BookShelfBase extends StatelessWidget {
  const BookShelfBase({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book shelf',
      home: BookShelfHomeScreen(),
    );
  }
}
