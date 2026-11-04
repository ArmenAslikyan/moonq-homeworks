import 'package:flutter/material.dart';
import 'package:vanadzor_quiz/models/quiz_question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question});

  final QuizQuestion question;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xff1b2921),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff30483a)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _tag(Icons.account_balance_outlined, 'Վանաձորի պատմություն'),
              const Spacer(),
              _tag(Icons.location_on_outlined, 'Լոռու մարզ'),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            question.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.4,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 11),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.menu_book_outlined,
                color: Color(0xffd8a949),
                size: 15,
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  'Ընտրիր մեկ ճիշտ պատասխան։',
                  style: TextStyle(
                    color: Color(0xffa1b6ab),
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tag(IconData icon, String text) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xff17422c),
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: const Color(0xff286544)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xff74ff9d), size: 12),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xffa8f4c2),
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
