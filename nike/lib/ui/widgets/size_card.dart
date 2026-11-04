import 'package:flutter/material.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({super.key, required this.color, required this.text_color, required this.size});
  final Color color;
  final Color text_color;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      child: Container(
        width: 45,
        height: 35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 41, 72, 104), width: 1.2)
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(color: text_color),
          ),
        ),
      )
    );
  }
}
