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
  State<StatefulWidget> createState() => NativeCallWidgetState();
}

class NativeCallWidgetState extends State<NativeCallWidget> {
  String? resultMessage;
  String? receiveMessage;

  Future<void> nativeCall() async {
    if (kIsWeb) {
      // ✅ Web에서는 mock response 사용
      setState(() {
        resultMessage = "Web Result One, Web Result Two";
        receiveMessage = "Web simulated callback";
      });
    } else {
      const channel = MethodChannel('myMethodChannel');
      try {
        var details = {'Username': 'kkang', 'Password': '1234'};
        final Map result = await channel.invokeMethod("oneMethod", details);
        setState(() {
          resultMessage = "${result['one']}, ${result['two']}";
        });

        channel.setMethodCallHandler((call) async {
          if (call.method == 'twoMethod') {
            setState(() {
              receiveMessage = 'receive : ${call.arguments}';
            });
            return 'Reply from Dart';
          }
          return null;
        });
      } on PlatformException catch (e) {
        print('failed: ${e.message}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Method Channel')),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'resultMessage: $resultMessage',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
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
