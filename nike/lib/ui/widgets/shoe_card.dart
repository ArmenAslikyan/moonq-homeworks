import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    super.key,
    required this.image,
  });

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      child: Container(
        width: 80,
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xffe2e0df),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 41, 72, 104), width: 1.2)
        ),
        child: Center(
          child: SizedBox(
            width: 70,
            height: 60,
            child: FittedBox(
              fit: BoxFit.cover,
              alignment: const Alignment(0.2, 0.5),
              child: image,
            ),
          ),
        ),
      ),
    );
  }
}
