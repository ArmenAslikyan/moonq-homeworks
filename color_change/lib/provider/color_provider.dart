import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Color> colors = [Colors.red, Colors.blue, Colors.green];

  Color get color => colors[_currentIndex];

  void nextColor() {
    _currentIndex = (_currentIndex + 1) % colors.length;
    notifyListeners();
  }
}