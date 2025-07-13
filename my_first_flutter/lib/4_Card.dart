import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('카드 리스트')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MyCard(title: '첫 번째 카드', icon: Icons.star, color: Colors.orange),
          MyCard(title: '두 번째 카드', icon: Icons.favorite, color: Colors.red),
          MyCard(title: '세 번째 카드', icon: Icons.thumb_up, color: Colors.blue),
        ],
      ),
    ),
  ));
}

class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const MyCard({required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: color, size: 36),
        title: Text(title, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}