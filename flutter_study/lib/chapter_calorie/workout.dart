class Workout {
  final String name;
  int weight;
  int goal;
  int instensity;

  Workout({
    required this.name,
    required this.weight,
    required this.goal,
    required this.instensity,
  });

  int calculateCalories() {
    // 예시 계산식: 단순 계산
    return (weight + 1) * goal * instensity;
  }
}
