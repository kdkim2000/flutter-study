import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
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
  State<StatefulWidget> createState() => NativeCallWidgetState();
}

class NativeCallWidgetState extends State<NativeCallWidget> {
  String? resultMessage;
  String? receiveMessage;

  Future<void> nativeCall() async {
    if (kIsWeb) {
      // ✅ 웹일 경우: 모의 응답 처리
      setState(() {
        resultMessage = 'Web Mock Result';
        receiveMessage = 'Web Mock Response from JS';
      });
    } else {
      // ✅ 모바일(Android/iOS)일 경우
      const channel = BasicMessageChannel<String>('myMessageChannel', StringCodec());

      String? result = await channel.send('Hello from Dart');
      setState(() {
        resultMessage = result;
      });

      // 수신 메시지 처리 핸들러 등록
      channel.setMessageHandler((String? message) async {
        setState(() {
          receiveMessage = message;
        });
        return 'Reply from Dart';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Channel')),
      body: Container(
        color: Colors.deepPurpleAccent,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'resultMessage: ${resultMessage ?? "none"}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'receiveMessage: ${receiveMessage ?? "none"}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 20),
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
