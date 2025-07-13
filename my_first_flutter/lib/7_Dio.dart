import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(DioDemo());

class DioDemo extends StatefulWidget {
  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  String result = '로딩중...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final dio = Dio();
    try {
      final res = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
      setState(() => result = res.data.toString());
    } catch (e) {
      setState(() => result = '에러: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('dio 패키지 예제')),
        body: Center(child: Text(result)),
      ),
    );
  }
}