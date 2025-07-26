import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<String> result = [];

  dioTest() async {
    try {
      var dio = Dio(
        BaseOptions(
          baseUrl: "https://jsonplaceholder.typicode.com/",
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 5000),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );
      List<Response<dynamic>> respone = await Future.wait([
        dio.get('https://jsonplaceholder.typicode.com/posts/1'),
        dio.get('https://jsonplaceholder.typicode.com/posts/2'),
        dio.get('https://jsonplaceholder.typicode.com/posts/3'),
      ]);
      for (var element in respone) {
        if (element.statusCode == 200) {
          setState(() {
            result.add(element.data.toString());
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(result[index]));
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: dioTest,
                child: Text('Get Server Data'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
