import 'package:flutter/material.dart';

class ProfileDetails extends ChangeNotifier {
  String name = '';
  String surname = '';

  void setDetails(String newName, String newSurname) {
    name = newName.trim();
    surname = newSurname.trim();
    notifyListeners();
  }
}