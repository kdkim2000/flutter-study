import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(DateFormatApp());

class DateFormatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatted = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('intl 날짜 포맷')),
        body: Center(
          child: Text('현재 시간: $formatted', style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}