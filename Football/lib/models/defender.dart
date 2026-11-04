import 'package:football/models/player.dart';

class Defender extends Player {
  Defender({
    required super.name,
    required super.age,
    super.goals,
  });
}