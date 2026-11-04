import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanadzor_quiz/data/quiz_questions.dart';
import 'package:vanadzor_quiz/data/working_with_user_data.dart';
import 'package:vanadzor_quiz/models/quiz_question.dart';
import 'package:vanadzor_quiz/provider/profile_details.dart';
import 'package:vanadzor_quiz/screens/leaderboard_screen.dart';
import 'package:vanadzor_quiz/widgets/answer_option.dart';
import 'package:vanadzor_quiz/widgets/progress_indicator.dart';
import 'package:vanadzor_quiz/widgets/question_card.dart';
import 'package:vanadzor_quiz/widgets/app_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<QuizQuestion> _questions = generateRandomQuizQuestions();
  int _questionIndex = 0;
  int _score = 0;
  String? _selectedOptionId;
  bool _scoreSaveStarted = false;
  Future<void>? _scoreSaveFuture;

  QuizQuestion get _question => _questions[_questionIndex];

  void _selectOption(QuizOption option) {
    if (_selectedOptionId != null) return;
    setState(() {
      _selectedOptionId = option.id;
      if (_question.isCorrect(option.id)) _score++;
    });
  }

  void _continue() {
    if (_selectedOptionId == null) return;
    if (_questionIndex == _questions.length - 1) {
      setState(() => _questionIndex++);
      _scoreSaveFuture = _saveScore();
      return;
    }
    setState(() {
      _questionIndex++;
      _selectedOptionId = null;
    });
  }

  Future<void> _saveScore() async {
    if (_scoreSaveStarted) return;
    _scoreSaveStarted = true;

    final participant = context.read<ProfileDetails>();
    try {
      await saveUserData(participant.name, participant.surname, _score);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Չհաջողվեց պահպանել արդյունքը')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final complete = _questionIndex == _questions.length;

    return Scaffold(
      backgroundColor: const Color(0xff121a16),
      appBar: const VanadzorQuizAppBar(showBackButton: true),
      body: SafeArea(
        top: false,
        child: complete ? _buildResult() : _buildQuestion(),
      ),
    );
  }

  Widget _buildQuestion() {
    final answered = _selectedOptionId != null;
    final letters = ['A', 'B', 'C', 'D'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: QuizProgressIndicator(
            currentQuestion: _questionIndex + 1,
            totalQuestions: _questions.length,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Column(
              children: [
                QuestionCard(question: _question),
                const SizedBox(height: 14),
                for (
                  var index = 0;
                  index < _question.options.length;
                  index++
                ) ...[
                  if (index > 0) const SizedBox(height: 8),
                  AnswerOption(
                    option: _question.options[index],
                    letter: letters[index],
                    isSelected:
                        _selectedOptionId == _question.options[index].id,
                    isAnswered: answered,
                    isCorrect: _question.isCorrect(_question.options[index].id),
                    onTap: () => _selectOption(_question.options[index]),
                  ),
                ],
                if (answered) ...[
                  const SizedBox(height: 14),
                  _buildDidYouKnow(),
                ],
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: answered ? _continue : null,
              icon: Icon(
                _questionIndex == _questions.length - 1
                    ? Icons.emoji_events_outlined
                    : Icons.arrow_forward,
                size: 19,
              ),
              label: Text(
                _questionIndex == _questions.length - 1
                    ? 'Ավարտել վիկտորինան'
                    : 'Հաջորդ հարցը',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff74ff9d),
                disabledBackgroundColor: const Color(0xff294334),
                foregroundColor: const Color(0xff003314),
                disabledForegroundColor: const Color(0xff7d9687),
                textStyle: const TextStyle(fontWeight: FontWeight.w800),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDidYouKnow() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xff302719),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff75531c)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            color: Color(0xffffbd42),
            size: 19,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Գիտեի՞ք արդյոք',
                  style: TextStyle(
                    color: Color(0xffffc34e),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _question.didYouKnow,
                  style: const TextStyle(
                    color: Color(0xffded0b5),
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult() {
    final participant = context.watch<ProfileDetails>();
    final participantName = '${participant.name} ${participant.surname}'.trim();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.emoji_events, color: Color(0xffffc34e), size: 58),
          const SizedBox(height: 14),
          const Text(
            'Վիկտորինան ավարտված է',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          _resultRow('Մասնակից', participantName),
          const SizedBox(height: 9),
          _resultRow('Միավորներ', '$_score'),
          const SizedBox(height: 9),
          _resultRow('Առավելագույն միավոր', '${_questions.length}'),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xff302719),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xff75531c)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: Color(0xffffc34e),
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _feedbackForScore(),
                    style: const TextStyle(
                      color: Color(0xfff1e5ce),
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () async {
                await _scoreSaveFuture;
                if (!mounted) return;
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const LeaderboardScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.leaderboard_outlined),
              label: const Text('Դիտել վարկանիշային աղյուսակը'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xff74ff9d),
                side: const BorderSide(color: Color(0xff426151)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Վերադառնալ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff74ff9d),
                foregroundColor: const Color(0xff003314),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xff1b2921),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xff30483a)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Color(0xffa1b6ab), fontSize: 14),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _feedbackForScore() {
    if (_score >= 9) {
      return 'Գերազանց արդյունք։ Դուք իսկապես լավ գիտեք Վանաձորը։';
    }
    if (_score >= 7) {
      return 'Շատ լավ արդյունք։ Ձեր գիտելիքները Վանաձորի մասին տպավորիչ են։';
    }
    if (_score >= 4) {
      return 'Լավ աշխատանք։ Եվս մի քանի պատմություն, ու արդյունքն ավելի բարձր կլինի։';
    }
    return 'Շարունակեք բացահայտել Վանաձորի պատմությունն ու հետաքրքիր վայրերը։';
  }
}
