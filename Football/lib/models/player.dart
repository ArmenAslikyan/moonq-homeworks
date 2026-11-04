class Player {
  final String name;
  final int age;
  int goals;

  Player({
    required this.name,
    required this.age,
    this.goals = 0,
  });

  void scoreGoal() {
    goals++;
  }
}