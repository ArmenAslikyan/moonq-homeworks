import 'package:football/domain/i_player_repo.dart';
import 'package:football/models/player.dart';

class PlayerRepo implements IPlayerRepo {
  final List<Player> _players = [];

  @override
  List<Player> getPlayers() {
    return List.unmodifiable(_players);
  }

  @override
  void savePlayer(Player player) {
    _players.add(player);
  }

  @override
  void updatePlayer(Player player) {
    final index = _players.indexWhere((item) => item.name == player.name);

    if (index == -1) {
      print('Player "${player.name}" was not found.');
    }

    _players[index] = player;
  }
}
