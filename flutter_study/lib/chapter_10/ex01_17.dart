import 'package:flutter/material.dart';

void main() {
  print('시작');
  runApp(MyApp()); // runApp( 위젯 );
  print('종료');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Null Safety 적용

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '플러터 데모 홈 페이지'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title}); // Null Safety 적용

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _onClicked() {
    setState(() {
      _counter++;
      print('_counter : $_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('하단 버튼을 눌러주세요:'),
            Text(
              '클릭수: $_counter',
              style: Theme.of(context).textTheme.headlineMedium, // 최신 API
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
