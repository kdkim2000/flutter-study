import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // 추가

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null); // 로케일 데이터 초기화
  runApp(IntlDemo());
}

class IntlDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatted = DateFormat('yyyy-MM-dd E HH:mm:ss', 'ko_KR').format(now);
    final number = NumberFormat('#,###').format(1234567);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('intl 패키지 예제')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('날짜: $formatted', style: TextStyle(fontSize: 18)),
              SizedBox(height: 16),
              Text('숫자 포맷: $number', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}