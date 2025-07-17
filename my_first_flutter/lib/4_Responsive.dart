import 'package:flutter/material.dart';

void main() => runApp(MyResponsiveApp());

class MyResponsiveApp extends StatelessWidget {
  const MyResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ResponsiveHomePage());
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isWide = width > 600;

    return Scaffold(
      appBar: AppBar(title: Text('반응형 레이아웃')),
      body: isWide
          ? Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Center(child: Text('왼쪽')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Center(child: Text('오른쪽')),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Center(child: Text('위')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Center(child: Text('아래')),
                  ),
                ),
              ],
            ),
    );
  }
}
