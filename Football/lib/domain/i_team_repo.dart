import 'package:football/models/team.dart';

abstract interface class ITeamRepo {
  List<Team> getTeams();
  void saveTeam(Team team);
  void updateTeam(Team team);
}
