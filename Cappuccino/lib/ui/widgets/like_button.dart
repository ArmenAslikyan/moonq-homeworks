import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          liked = !liked;
        });
      },
      child: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.pink : const Color.fromARGB(255, 134, 128, 128),
      ),
    );
  }
}
