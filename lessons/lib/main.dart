import 'package:flutter/material.dart';
import 'package:lessons/provider/mode_provider.dart';
import 'package:lessons/ui/mode.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModeProvider(),
      child: MaterialApp(
        title: 'Lessons',
        debugShowCheckedModeBanner: false,
        home: const Mode(),
      ),
    );
  }
}
