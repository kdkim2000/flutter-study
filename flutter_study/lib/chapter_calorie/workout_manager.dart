import './workout.dart'; // Workout 모델에서 weight를 int로 선언해야 함

class WorkoutManager {
  final List<Workout> _targetWorkout = [
    Workout(name: '싯업', weight: 0, goal: 30, instensity: 2),
    Workout(name: '턱걸이', weight: 0, goal: 10, instensity: 3),
    Workout(name: '푸시업', weight: 0, goal: 20, instensity: 2),
    Workout(name: '스쿼트', weight: 20, goal: 40, instensity: 2),
    Workout(name: '덤벨프레스', weight: 12, goal: 30, instensity: 2),
    Workout(name: '크런치', weight: 0, goal: 25, instensity: 1),
    Workout(name: '딥스', weight: 0, goal: 15, instensity: 3),
    Workout(name: '레그컬', weight: 25, goal: 20, instensity: 2),
  ];

  int _workoutIndex = 0;
  final List<int> _savedWorkoutCalories = [];

  // Getters
  String get getName => _targetWorkout[_workoutIndex].name;
  int get getGoal => _targetWorkout[_workoutIndex].goal;
  int get getWeight => _targetWorkout[_workoutIndex].weight;
  int get getInstensity => _targetWorkout[_workoutIndex].instensity;

  // 이전 운동으로 이동
  void prevWorkout() {
    if (_workoutIndex == 0) {
      _workoutIndex = _targetWorkout.length - 1;
    } else {
      _workoutIndex--;
    }
  }

  // 다음 운동으로 이동
  void nextWorkout() {
    if (_workoutIndex < _targetWorkout.length - 1) {
      _workoutIndex++;
    } else {
      _workoutIndex = 0;
    }
  }

  // 무게 조정
  void decreaseWeight() {
    if (_targetWorkout[_workoutIndex].weight > 0) {
      _targetWorkout[_workoutIndex].weight--;
    }
  }

  void increaseWeight() {
    _targetWorkout[_workoutIndex].weight++;
  }

  // 목표 횟수 조정
  void decreaseGoal() {
    if (_targetWorkout[_workoutIndex].goal > 0) {
      _targetWorkout[_workoutIndex].goal--;
    }
  }

  void increaseGoal() {
    _targetWorkout[_workoutIndex].goal++;
  }

  // 운동 저장
  void saveWorkout() {
    _savedWorkoutCalories
        .add(_targetWorkout[_workoutIndex].calculateCalories());
  }

  int getSaveWorkoutLength() => _savedWorkoutCalories.length;

  void resetSaveWorkoutCalories() {
    _savedWorkoutCalories.clear();
  }

  int getTotalCalories() {
    return _savedWorkoutCalories.fold(0, (sum, cal) => sum + cal);
  }
}
