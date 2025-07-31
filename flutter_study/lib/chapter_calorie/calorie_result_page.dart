import 'package:flutter/material.dart';
import './item_card.dart';
import './workout_manager.dart';
import './constants.dart';

class CalorieResultPage extends StatefulWidget {
  static String routeName = '/calorie_result';
  final int totalCalories;

  const CalorieResultPage({Key? key, required this.totalCalories})
    : super(key: key);

  @override
  State<CalorieResultPage> createState() => _CalorieResultPageState();
}

class _CalorieResultPageState extends State<CalorieResultPage> {
  WorkoutManager workoutManager = WorkoutManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calorie Result')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '결과',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ItemCard(
              customMargin: EdgeInsets.all(cardMargin),
              customchild: Center(
                child: Text(
                  '${widget.totalCalories} kcal',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // 이전 페이지로 돌아가기);
              },
              icon: const Icon(Icons.refresh, size: 30),
              label: Text(
                '다시계산',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


