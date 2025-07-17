import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 상태 데이터 클래스 (ChangeNotifier 상속)
class CounterModel extends ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners(); // 값이 바뀌면 UI에 알림
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CounterModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider 카운터')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text('${counter.count}', style: TextStyle(fontSize: 40));
              },
            ),
            ElevatedButton(
              onPressed: Provider.of<CounterModel>(context, listen: false).increase,
              child: Text('증가'),
            ),
          ],
        ),
      ),
    );
  }
}
