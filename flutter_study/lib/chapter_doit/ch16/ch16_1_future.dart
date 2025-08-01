import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<int> sum() {
    return Future<int>(() async {
      var sum = 0;

      for (int i = 0; i < 500000000; i++) {
        sum += i;
      }
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test')),
        body: FutureBuilder(
          future: sum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(),
                  ),
                  Text('waiting', style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
