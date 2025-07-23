import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Counter(), child: MyApp()),
  );
}

class Counter extends ChangeNotifier {
  int count = 0;
  void increase() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Provider 예제')),
        body: Center(
          child: Consumer<Counter>(
            builder: (context, counter, child) =>
                Text('${counter.count}', style: TextStyle(fontSize: 40)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Counter>().increase(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
