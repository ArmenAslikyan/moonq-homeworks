import 'package:football/models/player.dart';

class Forward extends Player {
  Forward({
    required super.name,
    required super.age,
    super.goals,
  });
}
