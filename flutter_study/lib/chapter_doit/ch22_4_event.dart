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
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel = EventChannel('eventChannel');
    channel.receiveBroadcastStream().listen((dynamic event) {
      setState(() {
        receiveMessage = 'Receive event : $event';
      });
    }, onError: (dynamic error){
      print('Receive error: ${error.message}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Channel'),),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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













