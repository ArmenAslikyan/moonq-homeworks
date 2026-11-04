import 'dart:convert';
import 'package:akinator/models/question.dart';
import 'package:akinator/domain/i_questions_repo.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class QuestionsRepo implements IQuestionsRepo {
  List<Map<String, dynamic>> _df = [];
  Map<String, String> _questions = {};

  QuestionsRepo();

  @override
  Future<void> loadDatabase() async {
    final csvString = await rootBundle.loadString('assets/data.csv');
    final rows = Csv().decode(csvString);

    if (rows.isEmpty) return;

    final headers = rows.first.map((e) => e.toString()).toList();
    _df = rows
        .skip(1)
        .where((row) => row.length >= headers.length)
        .map((row) {
      final map = <String, dynamic>{};
      for (int i = 0; i < headers.length; i++) {
        map[headers[i]] = row[i];
      }
      return map;
    }).toList();

    final jsonString = await rootBundle.loadString('assets/questions.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _questions = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  @override
  Future<void> loadQuestions() async {
    await loadDatabase();
  }

  List<String> possibleCharacters() {
    return _df
        .map((row) => row['name'])
        .where((name) => name != null && name.toString().trim().isNotEmpty)
        .map((name) => name.toString())
        .toList();
  }

  String? finalCharacter() {
    if (_df.length == 1) {
      final name = _df.first['name'];
      if (name != null && name.toString().trim().isNotEmpty) {
        return name.toString();
      }
    }
    return null;
  }

  String? guessCharacter() {
    if (_df.isEmpty) {
      return null;
    }

    final name = _df.first['name'];
    if (name != null && name.toString().trim().isNotEmpty) {
      return name.toString();
    }

    return null;
  }

  @override
  Question nextQuestion() {
    final List<MapEntry<String, int>> validFeatures = [];
    if (_df.isEmpty) {
      return Question(number: 0, key: '', question: "No questions available");
    }
    
    final columns = _df.first.keys;
    for (final col in columns) {
      if (_questions.containsKey(col) && col != 'name') {
        int ones = 0;
        for (final row in _df) {
          final val = row[col];
          if (val == 1 || val == true || val == '1') {
            ones++;
          }
        }
        final zeros = _df.length - ones;
        if (ones > 0 && zeros > 0) {
          validFeatures.add(MapEntry(col, (ones - zeros).abs()));
        }
      }
    }

    if (validFeatures.isEmpty) {
      return Question(number: 0, key: '', question: "No questions available");
    }

    validFeatures.sort((a, b) => a.value.compareTo(b.value));
    final bestCol = validFeatures.first.key;
    final questionText = _questions[bestCol] ?? "";

    return Question(number: 2, key: bestCol, question: questionText);
  }

  @override
  void answer(String columnKey, bool isYes) {
    _df = _df.where((row) {
      final val = row[columnKey];
      final matches = (val == 1 || val == true || val == '1');
      return isYes ? matches : !matches;
    }).toList();
  }
}
