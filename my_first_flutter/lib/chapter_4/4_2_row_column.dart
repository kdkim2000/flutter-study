import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
              ),
              Container(
                width: 200,
                height: 100,
                padding: EdgeInsets.all(16), // 안쪽 여백
                margin: EdgeInsets.symmetric(vertical: 12), // 바깥 여백
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16), // 둥근 테두리
                  boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)],
                ),
                child: Text('이것은 Container입니다', style: TextStyle(fontSize: 18)),
              ),
              Row(
                children: [
                  Expanded(child: Container(color: Colors.blue, height: 50)),
                  Expanded(child: Container(color: Colors.red, height: 50)),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(color: Colors.green, height: 50),
                  ),
                  Flexible(
                    flex: 10,
                    child: Container(color: Colors.yellow, height: 50),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  Spacer(), // 남는 공간을 모두 차지
                  Icon(Icons.arrow_forward),
                ],
              ),
              Column(
                children: [
                  Text('윗줄'),
                  SizedBox(height: 20), // 20픽셀 간격
                  Text('아랫줄'),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
