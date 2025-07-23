import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(PrefsDemo());

class PrefsDemo extends StatefulWidget {
  const PrefsDemo({super.key});

  @override
  State<PrefsDemo> createState() => _PrefsDemoState();
}

class _PrefsDemoState extends State<PrefsDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _increment() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('shared_preferences 예제')),
        body: Center(child: Text('$_counter', style: TextStyle(fontSize: 40))),
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}