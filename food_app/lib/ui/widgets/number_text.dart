import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  const NumberText({
    super.key,
    required this.number,
    required this.text,
    this.badgeColor = Colors.amber,
  });

  final String number;
  final String text;
  final Color badgeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 87, 16, 16),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(number,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        ),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
