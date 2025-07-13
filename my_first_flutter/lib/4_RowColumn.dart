import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Row & Column 예제')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 32),
                SizedBox(width: 10),
                Text('홈 화면', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('A')),
                ElevatedButton(onPressed: () {}, child: Text('B')),
                ElevatedButton(onPressed: () {}, child: Text('C')),
              ],
            )
          ],
        ),
      ),
    ),
  ));
}