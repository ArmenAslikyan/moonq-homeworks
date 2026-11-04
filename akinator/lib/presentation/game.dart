import 'package:akinator/domain/i_character_image_repo.dart';
import 'package:akinator/domain/i_questions_repo.dart';
import 'package:akinator/infrastructure/character_image_repo.dart';
import 'package:akinator/infrastructure/questions_repo.dart';
import 'package:akinator/models/character.dart';
import 'package:akinator/models/question.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final IQuestionsRepo _db = QuestionsRepo();
  final ICharacterImageRepo _imageRepo = CharacterImageRepo();

  bool _isLoading = true;
  bool _isFetchingImage = false;
  Question? _currentQuestion;
  Character? _finalCharacter;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  Future<void> _initGame() async {
    await _db.loadDatabase();
    if (!mounted) return;

    await _updateState();
  }

  Future<void> _updateState() async {
    final question = _db.nextQuestion();
    String? guessedName = _db.finalCharacter();

    if (guessedName == null && question.question == "No questions available") {
      guessedName = _db.guessCharacter();
    }

    if (guessedName != null) {
      setState(() {
        _isLoading = false;
        _isFetchingImage = true;
        _finalCharacter = Character(name: guessedName!);
      });

      final imageUrl = await _imageRepo.getImageUrl(guessedName);
      if (!mounted) return;

      setState(() {
        _isFetchingImage = false;
        _finalCharacter = Character(name: guessedName!, imageUrl: imageUrl);
      });
    } else {
      setState(() {
        _currentQuestion = question;
        _isLoading = false;
      });
    }
  }

  void _answerQuestion(bool isYes) {
    if (_currentQuestion == null || _currentQuestion!.key.isEmpty) return;

    _db.answer(_currentQuestion!.key, isYes);
    _updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 144, 10, 159),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/akinator_header.jpeg',
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                alignment: Alignment.topCenter,
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : (_finalCharacter != null
                        ? _buildResultView()
                        : _buildQuestionView()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "I guess your character is...",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _finalCharacter!.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            if (_isFetchingImage)
              const CircularProgressIndicator()
            else if (_finalCharacter!.imageUrl != null &&
                _finalCharacter!.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  _finalCharacter!.imageUrl!,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 100, color: Colors.grey),
                ),
              )
            else
              const Icon(Icons.person, size: 100, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _currentQuestion?.question ?? "No more questions!",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _answerQuestion(true),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('Yes', style: TextStyle(fontSize: 18)),
            ),
            ElevatedButton(
              onPressed: () => _answerQuestion(false),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('No', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ],
    );
  }
}
