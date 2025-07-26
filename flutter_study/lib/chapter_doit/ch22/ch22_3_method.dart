import 'dart:async';
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
class NativeCallWidgetState extends State<NativeCallWidget>{
  String? resultMessage;
  String? receiveMessage;

  Future<Null> nativeCall() async {
    const channel = MethodChannel('myMethodChannel');
    try{
      var details = {'Username': 'kkang', 'Password':'1234'};
      final Map result = await channel.invokeMethod("oneMethod", details);
      setState(() {
        resultMessage = "${result['one']}, ${result['two']}";
      });
      channel.setMethodCallHandler((call) async {
        switch (call.method){
          case 'twoMethod':
            setState(() {
              receiveMessage = 'receive : ${call.arguments}';
            });
            return 'Reply from Dart';
        }
      });
    }on PlatformException catch(e){
      print('failed: ${e.message}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Method Channel'),),
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













