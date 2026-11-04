import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.text,
    required this.isCorrect,
    required this.isSelected,
    required this.showResult,
    required this.onTap,
    super.key,
  });

  final String text;
  final bool isCorrect;
  final bool isSelected;
  final bool showResult;
  final VoidCallback? onTap;

  static const Color normalColor = Colors.black;
  static const Color correctColor = Colors.green;
  static const Color incorrectColor = Colors.red;
  static const Color labelColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = showResult && isCorrect
      ? correctColor
        : showResult && isSelected
        ? incorrectColor
        : normalColor;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
            child: Center(child: Text(text,
              style: TextStyle(color: labelColor),
              )
            ),
          )
        ),
      ),
    );
  }
}