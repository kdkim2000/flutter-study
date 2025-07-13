import 'package:flutter/material.dart';

void main() => runApp(const MyRoutingApp());

class MyRoutingApp extends StatelessWidget {
  const MyRoutingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '라우팅 기본',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('첫 번째 페이지')),
      body: Center(
        child: ElevatedButton(
          child: Text('다음 페이지로 이동'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('두 번째 페이지')),
      body: Center(
        child: ElevatedButton(
          child: Text('이전 페이지로 돌아가기'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}