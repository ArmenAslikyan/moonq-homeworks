import 'package:flutter/material.dart';

class QuizProgressIndicator extends StatelessWidget {
  const QuizProgressIndicator({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  final int currentQuestion;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    final progress = totalQuestions == 0
        ? 0.0
        : currentQuestion / totalQuestions;

    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.quiz_outlined, color: Color(0xff74ff9d), size: 17),
            const SizedBox(width: 7),
            Text(
              'Հարց $currentQuestion/$totalQuestions',
              style: const TextStyle(
                color: Color(0xff74ff9d),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: const Color(0xff26362d),
            valueColor: const AlwaysStoppedAnimation(Color(0xff74ff9d)),
          ),
        ),
      ],
    );
  }
}
