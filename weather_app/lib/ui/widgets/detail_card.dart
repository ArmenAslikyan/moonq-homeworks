/// A semi-transparent rounded card that groups detail rows together.

import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  /// The list of row widgets to show inside this card.
  final List<Widget> children;

  const DetailCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}

