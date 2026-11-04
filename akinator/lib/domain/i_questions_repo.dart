import 'package:akinator/models/question.dart';

abstract interface class IQuestionsRepo {
  IQuestionsRepo();
  Future<void> loadDatabase();
  Future<void> loadQuestions();
  Question nextQuestion();
  void answer(String columnKey, bool isYes);
  String? finalCharacter();
  String? guessCharacter();
}
