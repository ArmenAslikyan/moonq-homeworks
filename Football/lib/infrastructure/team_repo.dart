import 'package:football/domain/i_team_repo.dart';
import 'package:football/models/team.dart';


class TeamRepo implements ITeamRepo {
  final List<Team> _teams = [];

  @override
  List<Team> getTeams() {
    return List.unmodifiable(_teams);
  }

  @override
  void saveTeam(Team team) {
    _teams.add(team);
  }

  @override
  void updateTeam(Team team) {
    final index = _teams.indexWhere((item) => item.name == team.name);

    if (index == -1) {
      print('Team "${team.name}" was not found.');
    }

    _teams[index] = team;
  }
}
