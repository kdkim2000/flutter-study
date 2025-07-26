import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> logs = [];

  void _addLog(String msg) {
    setState(() {
      logs.add(msg);
    });
  }

  void subscriptionTest() {
    var stream = Stream.fromIterable([1, 2, 3]);
    StreamSubscription subscription = stream.listen(null);

    subscription.onData((data) {
      _addLog('value: $data');
    });
    subscription.onError((error) {
      _addLog('error: $error');
    });
    subscription.onDone(() {
      _addLog('stream done...');
    });
  }

  void controllerTest() {
    var controller = StreamController();

    var stream1 = Stream.fromIterable([1, 2, 3]);
    var stream2 = Stream.fromIterable(['A', 'B', 'C']);

    stream1.listen((value) {
      controller.add(value);
    });
    stream2.listen((value) {
      controller.add(value);
    });

    controller.stream.listen((value) {
      _addLog('controller: $value');
    });
  }

  void transformerTest() {
    var stream = Stream.fromIterable([1, 2, 3]);

    StreamTransformer<int, dynamic> transformer =
        StreamTransformer.fromHandlers(handleData: (value, sink) {
      _addLog('in transformer... $value');
      sink.add(value * value);
    });

    stream.transform(transformer).listen((value) {
      _addLog('in listen... $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Test'),
      ),
      body: Column(
        children: [
          // 버튼 영역
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: subscriptionTest,
                  child: Text('subscription'),
                ),
                ElevatedButton(
                  onPressed: controllerTest,
                  child: Text('controller'),
                ),
                ElevatedButton(
                  onPressed: transformerTest,
                  child: Text('transformer'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => logs.clear()),
                  child: Text('Clear'),
                ),
              ],
            ),
          ),
          Divider(),
          // 로그 출력 영역
          Expanded(
            child: ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(logs[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
