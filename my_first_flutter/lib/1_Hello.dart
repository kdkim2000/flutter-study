import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  runApp(const MyInfoApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter 첫 앱')),
        body: Center(child: Text('Hello Flutter!')),
      ),
    );
  }
}

class MyInfoApp extends StatelessWidget {
  const MyInfoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('내 정보')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('이름: 홍길동', style: TextStyle(fontSize: 24)),
              SizedBox(height: 12),
              Text('Flutter 공부 시작!', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}