import 'package:football/models/player.dart';

class Team {
  final String name;
  final List<Player> players;
  int wins;
  int draws;
  int losses;

  Team({
    required this.name,
    List<Player>? players,
    this.wins = 0,
    this.draws = 0,
    this.losses = 0,
  }) : players = players ?? [];

  int get points => wins * 3 + draws;

  int get matchesPlayed => wins + draws + losses;

  int get goals => players.fold(0, (sum, player) => sum + player.goals);

  void addPlayer(Player player) {
    players.add(player);
  }

  void registerWin() {
    wins++;
  }

  void registerDraw() {
    draws++;
  }

  void registerLoss() {
    losses++;
  }
}
