import 'package:flutter/material.dart';
import 'package:lessons/provider/mode_provider.dart';
import 'package:provider/provider.dart';

class Mode extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final modeProv = context.watch<ModeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${modeProv.mode}',
        ),
        actions: [
          
        ],
      ),
    );
  }
}