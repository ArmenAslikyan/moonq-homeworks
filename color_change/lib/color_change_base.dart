import 'package:color_change/presentation/color_change.dart';
import 'package:flutter/material.dart';

class ColorChangeBase extends StatelessWidget {
  const ColorChangeBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Color change',
      debugShowCheckedModeBanner: false,
      home: ColorChange()
    );
  }
}