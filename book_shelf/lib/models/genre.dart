import 'package:flutter/material.dart';

enum Genre {
  novel('Վեպ', Icons.auto_stories, Colors.indigo),
  history('Պատմություն', Icons.account_balance, Colors.brown),
  fantasy('Ֆանտաստիկա', Icons.auto_awesome, Colors.deepPurple),
  poetry('Բանաստեղծություն', Icons.history_edu, Colors.pink),
  detective('Դետեկտիվ', Icons.search, Colors.teal);

  const Genre(this.name, this.icon, this.color);

  final String name;
  final IconData icon;
  final Color color;
}
