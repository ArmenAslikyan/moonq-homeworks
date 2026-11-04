import 'package:football/models/player.dart';

abstract interface class IPlayerRepo {
  List<Player> getPlayers();
  void savePlayer(Player player);
  void updatePlayer(Player player);
}
