/// A single row inside a detail card, showing an icon, label, and value.

import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  /// The icon shown on the left side.
  final IconData icon;

  /// The label text (like "Humidity", "Wind", etc.).
  final String label;

  /// The value text (like "58%", "8.2 m/s N", etc.).
  final String value;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.white60, size: 22),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(color: Colors.white60, fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

