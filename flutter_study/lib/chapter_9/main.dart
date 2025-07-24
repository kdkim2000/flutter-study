import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart'; // flutterfire configure로 생성
import 'todo_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 목록 앱',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: TodoListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}