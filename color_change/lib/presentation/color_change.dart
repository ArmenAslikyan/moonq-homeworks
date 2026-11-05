import 'package:color_change/provider/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorChange extends StatelessWidget {
  const ColorChange({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ColorProvider>();
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => context.read<ColorProvider>().nextColor(),
          child: Container(
            height: 240,
            width: 240, 
            color: provider.color,
          ),
        ),
      ),
    );
  }
}