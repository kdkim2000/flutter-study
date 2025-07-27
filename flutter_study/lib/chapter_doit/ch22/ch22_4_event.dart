import 'dart:async';
import 'package:flutter/foundation.dart'; // kIsWeb 사용
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Channel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NativeCallWidget(),
    );
  }
}

class NativeCallWidget extends StatefulWidget {
  const NativeCallWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return NativeCallWidgetState();
  }
}

class NativeCallWidgetState extends State<NativeCallWidget> {
  String? receiveMessage;
  StreamSubscription? _subscription;

  Future<void> nativeCall() async {
    if (kIsWeb) {
      // Web에서는 Stream을 에뮬레이션
      Stream<String> mockStream = Stream.periodic(
        Duration(seconds: 1),
        (count) => 'Web simulated event $count',
      ).take(5); // 5개 이벤트 후 종료

      _subscription = mockStream.listen((event) {
        setState(() {
          receiveMessage = 'Receive event: $event';
        });
      });
    } else {
      const channel = EventChannel('eventChannel');
      _subscription = channel.receiveBroadcastStream().listen(
        (dynamic event) {
          setState(() {
            receiveMessage = 'Receive event: $event';
          });
        },
        onError: (dynamic error) {
          print('Receive error: ${error.message}');
        },
      );
    }
  }

  @override
  void dispose() {
    _subscription?.cancel(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Channel')),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'receiveMessage: $receiveMessage',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: nativeCall,
                child: Text('native call'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
