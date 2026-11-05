import 'package:flutter/foundation.dart';

class ToDoProvider extends ChangeNotifier {
  final List<String> toDos = [];

  void add(String toDo) {
    toDos.add(toDo);
    notifyListeners();
  }
}