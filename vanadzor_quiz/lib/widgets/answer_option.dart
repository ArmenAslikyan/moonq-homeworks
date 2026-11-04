import 'package:flutter/material.dart';
import 'package:vanadzor_quiz/models/quiz_question.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.option,
    required this.letter,
    required this.isSelected,
    required this.isAnswered,
    required this.isCorrect,
    required this.onTap,
  });

  final QuizOption option;
  final String letter;
  final bool isSelected;
  final bool isAnswered;
  final bool isCorrect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final correctSelected = isAnswered && isCorrect;
    final wrongSelected = isAnswered && isSelected && !isCorrect;
    final background = correctSelected
        ? const Color(0xff145333)
        : wrongSelected
        ? const Color(0xff3a2024)
        : const Color(0xff1b2921);
    final border = correctSelected
        ? const Color(0xff55f59b)
        : wrongSelected
        ? const Color(0xffc65b62)
        : const Color(0xff293b31);
    final badgeBackground = correctSelected
        ? const Color(0xff74ff9d)
        : wrongSelected
        ? const Color(0xff6d3037)
        : const Color(0xff2a4035);

    return SizedBox(
      width: double.infinity,
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(13),
        child: InkWell(
          onTap: isAnswered ? null : onTap,
          borderRadius: BorderRadius.circular(13),
          child: Container(
            constraints: const BoxConstraints(minHeight: 62),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: border,
                width: correctSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: badgeBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    letter,
                    style: TextStyle(
                      color: correctSelected
                          ? const Color(0xff003314)
                          : wrongSelected
                          ? const Color(0xffffa3a7)
                          : const Color(0xffe4eee8),
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    option.text,
                    style: TextStyle(
                      color: wrongSelected
                          ? const Color(0xffd6babc)
                          : Colors.white,
                      fontWeight: correctSelected
                          ? FontWeight.w800
                          : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (correctSelected)
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xff74ff9d),
                    size: 19,
                  )
                else if (wrongSelected)
                  const Icon(Icons.cancel, color: Color(0xffef777d), size: 19)
                else
                  const Icon(Icons.circle, color: Color(0xff304239), size: 17),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
