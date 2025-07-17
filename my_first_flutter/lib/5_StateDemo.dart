import 'package:flutter/material.dart';

void main() => runApp(const StateDemoApp());

class StateDemoApp extends StatelessWidget {
  const StateDemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget 실습')),
        body: Center(child: MyCounter()),
      ),
    );
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});
  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _count = 0;

  void _increase() {
    setState(() {
      _count++;
    });
  }

  void _decrease() {
    setState(() {
      _count--;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_count', style: TextStyle(fontSize: 40)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _increase, child: Text('증가')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _decrease, child: Text('감소')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _reset, child: Text('초기화')),
          ],
        ),
      ],
    );
  }
}
