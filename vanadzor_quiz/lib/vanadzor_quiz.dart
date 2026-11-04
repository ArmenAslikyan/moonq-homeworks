import 'package:flutter/material.dart';
import 'package:vanadzor_quiz/screens/home_screen.dart';


class VanadzorQuiz extends StatelessWidget {
  const VanadzorQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vanadzor Quiz',
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}