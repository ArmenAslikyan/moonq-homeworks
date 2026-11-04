import 'package:flutter/material.dart';

class ShoeColor extends StatelessWidget {
  const ShoeColor({super.key,
  required this.borderColor,
  required this.color});

  final Color borderColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1.2)
        ),
        child: Center(
          child: SizedBox(
            width: 70,
            height: 60,
            child: FittedBox(
              fit: BoxFit.cover,
              alignment: const Alignment(0.2, 0.5),
            ),
          ),
        ),
      ),
    );
  }
}