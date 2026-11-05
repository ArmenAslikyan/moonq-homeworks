import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/provider/to_do_provider.dart';
import 'package:todo_list22/to_do_base.dart';

void main(){
  runApp(
    ChangeNotifierProvider<ToDoProvider>(
      create: (context) => ToDoProvider(),
      child: const ToDoBase(),
    ),
  );
}