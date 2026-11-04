import 'package:football/models/player.dart';

class Midfielder extends Player {
  Midfielder({
    required super.name,
    required super.age,
    super.goals,
  });
}