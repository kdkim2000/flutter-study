import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('내 프로필 카드')),
        body: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                ),
                SizedBox(height: 16),
                Text('홍길동', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Flutter 개발자', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('hong@example.com'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}