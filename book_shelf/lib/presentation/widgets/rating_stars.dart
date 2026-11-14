import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating, this.onRatingChanged});

  final int rating;
  final ValueChanged<int>? onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final icon = Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: 18,
          color: Colors.amber,
        );
        return onRatingChanged == null
            ? icon
            : IconButton(
                onPressed: () => onRatingChanged!(index + 1),
                icon: icon,
                color: Colors.amber,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              );
      }),
    );
  }
}
