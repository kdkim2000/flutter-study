import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  @override
  State<StatefulWidget> createState() {
    return NativeCallWidgetState();
  }
}
class NativeCallWidgetState extends State<NativeCallWidget>{
  String? resultMessage;
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel = BasicMessageChannel<String>('myMessageChannel', StringCodec());
    String? result = await channel.send('Hello from Dart');
    setState(() {
      resultMessage = result;
    });
    channel.setMessageHandler((String? message) async {
      setState(() {
        receiveMessage = message;
      });
      return 'Reply from Dart';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message Channel'),),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('resultMssage: $resultMessage', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              Text('receiveMssage: $receiveMessage', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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













