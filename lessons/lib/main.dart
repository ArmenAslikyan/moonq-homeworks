import 'package:flutter/material.dart';
import 'package:lessons/ui/button.dart';
import 'package:lessons/ui/listview.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lessons',
      debugShowCheckedModeBanner: false,
      home: const Listview(),
    );
  }
}
