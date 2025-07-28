import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '플러터 데모',
        theme: ThemeData(primaryColor: Colors.blue),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _login = '로그인';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플러터 데모'),
      ),
      body: Text(
        '$_login',
        style: TextStyle(fontSize: 40),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _login_clicked,
        child: Icon(Icons.login),
      ),
    );
  }

  void _login_clicked() {
    setState(() {
      if (this._login == '로그인') {
        this._login = '로그아웃';
      } else {
        this._login = '로그인';
      }
    });
  }
}
