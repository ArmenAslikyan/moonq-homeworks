import 'package:flutter/material.dart';

class ModeProvider extends ChangeNotifier{
  bool isDarkMode = false;
  String mode = 'Light';
  void changeMode(){
    isDarkMode = !isDarkMode;
    if (isDarkMode){
      mode = 'Dark';
    }else{
      mode = 'Light';
    }
  }
}