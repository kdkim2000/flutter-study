import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CounterApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class CounterApp extends StatefulWidget {
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0;

  void _increase() => setState(() => _count++);
  void _decrease() => setState(() => _count--);
  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('카운터 앱')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('현재 값:', style: TextStyle(fontSize: 24)),
            Text('$_count', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _increase, child: Text('증가')),
                SizedBox(width: 12),
                ElevatedButton(onPressed: _decrease, child: Text('감소')),
                SizedBox(width: 12),
                ElevatedButton(onPressed: _reset, child: Text('초기화')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
