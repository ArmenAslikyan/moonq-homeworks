/*
Տարբերակ 2 — Football Tournament ⚽️

Ստեղծել ֆուտբոլային մրցաշարի համակարգ։

Օրինակ՝

Team
- name
- players
- wins
- draws
- losses
- points

Player
- name
- age
- goals


Պետք է կարողանան՝

թիմ ստեղծել
խաղացող ավելացնել թիմին
խաղ անցկացնել երկու թիմերի միջև
հաշվի հիման վրա թարմացնել վիճակագրությունը
հաղթանակ = 3 միավոր
ոչ-ոքի = 1 միավոր
պարտություն = 0 միավոր
ցուցադրել մրցաշարի աղյուսակը
գտնել լավագույն ռմբարկուին

Bonus: օգտագործել inheritance, օրինակ՝

Player
 ├── Goalkeeper
 ├── Defender
 ├── Midfielder
 └── Forward
*/
import 'package:football/models/forward.dart';
import 'package:football/models/midfielder.dart';
import 'package:football/models/player.dart';
import 'package:football/models/team.dart';
import 'package:football/infrastructure/player_repo.dart';
import 'package:football/infrastructure/team_repo.dart';

void main() {
  final teamRepo = TeamRepo();
  final playerRepo = PlayerRepo();

  // Stextsel timery
  final barcelona = Team(name: 'Barcelona');
  final realMadrid = Team(name: 'Real Madrid');
  teamRepo.saveTeam(barcelona);
  teamRepo.saveTeam(realMadrid);

  // Stextsel futbolistin u avelacnel ira timit
  final messi = Forward(name: 'Messi', age: 38);
  final yamal = Forward(name: 'Lamine Yamal', age: 19);
  final bellingham = Midfielder(name: 'Jude Bellingham', age: 23);

  playerRepo.savePlayer(messi);
  playerRepo.savePlayer(yamal);
  playerRepo.savePlayer(bellingham);

  barcelona.addPlayer(messi);
  barcelona.addPlayer(yamal);
  realMadrid.addPlayer(bellingham);

  // Barca vs Real xax
  messi.scoreGoal();
  messi.scoreGoal();
  bellingham.scoreGoal();
  barcelona.registerWin();
  realMadrid.registerLoss();

  teamRepo.updateTeam(barcelona);
  teamRepo.updateTeam(realMadrid);

  // Tpel mrcasharayin axysuaky hertakanutyamb
  final standings = [...teamRepo.getTeams()]
    ..sort((first, second) => second.points.compareTo(first.points));

  print('Tournament table:');
  for (final team in standings) {
    print(
      '${team.name}: ${team.points} points '
      '(${team.wins}W ${team.draws}D ${team.losses}L)',
    );
  }

  // Lavaguyn rmbarku
  final players = playerRepo.getPlayers();
  final topScorer = players.reduce(
    (best, player) => player.goals > best.goals ? player : best,
  );

  print('Top scorer: ${topScorer.name} (${topScorer.goals} goals)');

  //Baracyi ardyunqnery
  final barcelonaGoals = barcelona.players.fold(
  0,
  (total, player) => total + player.goals,
  );

  print('----- Barca Stats -----');
  print('Goals: $barcelonaGoals');
  print('Wins: ${barcelona.wins}');
  print('Draws: ${barcelona.draws}');
  print('Losses: ${barcelona.losses}');
  print('Matches played: ${barcelona.matchesPlayed}');
  print('Points: ${barcelona.points}');
}
