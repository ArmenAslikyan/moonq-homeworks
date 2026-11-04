import 'package:flutter/material.dart';
import 'package:quiz_app/cors/questions.dart';
import 'package:quiz_app/ui/result_screen.dart';
import 'package:quiz_app/ui/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final int pageCount = questions.length;
  int currentIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;

  void _selectAnswer(int index) {
    if (selectedAnswerIndex != null) return;

    setState(() {
      selectedAnswerIndex = index;
      if (questions[currentIndex].correctIndex == index) {
        score++;
      }
    });
  }

  void _goToNextQuestion() {
    if (selectedAnswerIndex == null) return;

    if (currentIndex == pageCount - 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: pageCount,
          ),
        ),
      );
      return;
    }

    setState(() {
      currentIndex++;
      selectedAnswerIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Հարց ${currentIndex + 1} / $pageCount', style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(questions[currentIndex].text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: questions[currentIndex].options.length,
                  itemBuilder: (context, index) {
                    return AnswerButton(
                      text: questions[currentIndex].options[index],
                      isCorrect: questions[currentIndex].correctIndex == index,
                      isSelected: selectedAnswerIndex == index,
                      showResult: selectedAnswerIndex != null,
                      onTap: selectedAnswerIndex == null
                          ? () => _selectAnswer(index)
                          : null,
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedAnswerIndex == null
                      ? null
                      : _goToNextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade400,
                    disabledForegroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    currentIndex == pageCount - 1 ? 'Finish' : 'Next',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      )
    );
  }
}