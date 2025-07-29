import 'package:flutter/material.dart';
import 'package:flutter_study/chapter_calorie/workout_manager.dart';
import './item_card.dart'; // 커스텀 카드 위젯
import './constants.dart';

class CalorieCalculatorPage extends StatefulWidget {
  static String routeName = '/';

  const CalorieCalculatorPage({super.key});

  @override
  State<CalorieCalculatorPage> createState() => _CalorieCalculatorPageState();
}

class _CalorieCalculatorPageState extends State<CalorieCalculatorPage> {
  WorkoutManager workoutManager = WorkoutManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ItemCard(
                customMargin: EdgeInsets.all(cardMargin),
                customchild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '운동 선택',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('오늘 할 운동을 선택하세요'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              workoutManager.prevWorkout();
                            });
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                        Icon(
                          Icons.wind_power,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        Text(
                          workoutManager.getName,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              workoutManager.nextWorkout();
                            });
                          },
                          icon: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ItemCard(
                      customMargin: EdgeInsets.all(cardMargin),
                      customchild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '중량',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            workoutManager.getWeight.toString(),
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    workoutManager.decreaseWeight();
                                  });
                                },
                                icon: Icon(
                                  Icons.do_not_disturb_on,
                                  size: 55,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    workoutManager.increaseWeight();
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: 55,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ItemCard(
                      customMargin: EdgeInsets.all(cardMargin),
                      customchild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '운동횟수',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            workoutManager.getGoal.toString(),
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    workoutManager.increaseGoal();
                                  });
                                },
                                icon: Icon(
                                  Icons.do_not_disturb_on,
                                  size: 55,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    workoutManager.increaseGoal();
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: 55,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ItemCard(
                customMargin: EdgeInsets.all(cardMargin),
                customchild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '운동 강도',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('숫자가 높을수록 높은 강도의 운동 입니다.'),
                    Text(
                      workoutManager.getInstensity.toString(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: workoutManager.getInstensity.toDouble(),
                      min: 1,
                      max: 10,
                      onChanged: (double changedValue) {
                        setState(() {
                          workoutManager.setInstensity(changedValue.toInt());
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          workoutManager.saveWorkout();
                        });
                      },
                      child: ItemCard(
                        customMargin: EdgeInsets.all(cardMargin),
                        customchild: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_shopping_cart, size: 50),
                            Text(
                              '(${workoutManager.getSaveWorkoutLengt}개)',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ItemCard(
                      customMargin: EdgeInsets.all(cardMargin),
                      customchild: Icon(Icons.calculate_outlined, size: 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
