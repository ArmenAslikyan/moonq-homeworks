import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.icon,
    required this.data,
    required this.color,
    required this.iconColor,
  });

  final IconData icon;
  final String data;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 124, 119, 119),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 4), 
            )
          ]
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(height: 8),
            Text(data),
          ],
        ),
      ),
    );
  }
}
