import 'package:flutter/material.dart';
import 'package:todo_list22/presentation/to_do.dart';

class ToDoBase extends StatelessWidget {
  const ToDoBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ToDo list app',
      debugShowCheckedModeBanner: false,
      home: ToDo()
    );
  }
}