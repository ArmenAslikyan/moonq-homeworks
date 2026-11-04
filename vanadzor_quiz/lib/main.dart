import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vanadzor_quiz/firebase_options.dart';
import 'package:vanadzor_quiz/vanadzor_quiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const VanadzorQuiz());
}
