import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

// 첫 번째 페이지
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _result;

  void _goToSecondPage() async {
    // 여러 값(Map) 전달
    final params = {
      'username': '홍길동',
      'score': 95,
      'isAdmin': true,
    };
    // 화면 전환 및 결과 메시지 받기
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SecondPage(args: params),
      ),
    );
    if (result != null && result is String) {
      setState(() {
        _result = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('첫 번째 페이지')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _goToSecondPage,
              child: Text('두 번째 페이지로 이동 (Map 전달)'),
            ),
            SizedBox(height: 24),
            if (_result != null)
              Text('두 번째 페이지에서 온 메시지:\n$_result',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}

// 두 번째 페이지
class SecondPage extends StatelessWidget {
  final Map<String, dynamic> args;
  const SecondPage({required this.args, super.key});

  @override
  Widget build(BuildContext context) {
    // 전달받은 Map 사용 예시
    final username = args['username'];
    final score = args['score'];
    final isAdmin = args['isAdmin'];

    return Scaffold(
      appBar: AppBar(title: Text('두 번째 페이지')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('전달받은 값:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('이름: $username'),
            Text('점수: $score'),
            Text('관리자 여부: $isAdmin'),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('첫 번째 페이지로 메시지 돌려주기'),
              onPressed: () {
                // 메시지를 첫 페이지로 전달하면서 화면 종료(pop)
                Navigator.pop(context, '수고하셨습니다, $username님!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
