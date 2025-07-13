import 'package:flutter/material.dart';
import 'todo_list_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 목록',
      home: TodoListPage(),
    );
  }
}
