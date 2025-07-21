import 'package:flutter/material.dart';

void main() => runApp(MyArgApp());

class MyArgApp extends StatelessWidget {
  const MyArgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SendPage());
  }
}

class SendPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('데이터 전달(보내기)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: '이름을 입력하세요'),
            ),
            ElevatedButton(
              child: Text('다음 페이지로 전달'),
              onPressed: () {
                String name = controller.text.trim();
                if (name.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceivePage(name: name),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivePage extends StatelessWidget {
  final String name;

  const ReceivePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('데이터 전달(받기)')),
      body: Center(
        child: Text('안녕하세요, $name님!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
