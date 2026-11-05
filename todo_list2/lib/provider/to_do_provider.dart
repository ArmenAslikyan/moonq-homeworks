import 'package:flutter/foundation.dart';

class ToDoProvider extends ChangeNotifier {
  final List<String> toDos = [];

  void add(String toDo) {
    final trimmedToDo = toDo.trim();
    if (trimmedToDo.isEmpty) return;

    toDos.add(trimmedToDo);
    notifyListeners();
  }

  void delete(int index) {
    toDos.removeAt(index);
    notifyListeners();
  }
}