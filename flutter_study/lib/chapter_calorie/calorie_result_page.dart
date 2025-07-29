import 'package:flutter/material.dart';
import './item_card.dart'; // 임시 ItemCard 위젯 import

class CalorieResultPage extends StatefulWidget {
  static String routeName = '/calorie_result';
  final int totalCalories;

  const CalorieResultPage({
    Key? key,
    required this.totalCalories,
  }) : super(key: key);

  @override
  State<CalorieResultPage> createState() => _CalorieResultPageState();
}

class _CalorieResultPageState extends State<CalorieResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                '결과',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ItemCard(
              customMargin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('돌아가기'),
            ),
          ),
        ],
      ),
    );
  }
}
