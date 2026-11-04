import 'package:football/models/player.dart';

class Goalkeeper extends Player {
  Goalkeeper({
    required super.name,
    required super.age,
    super.goals,
  });
}