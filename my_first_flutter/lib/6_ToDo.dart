import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TodoListScreen());
  }
}

class TodoListScreen extends StatelessWidget {
  final List<String> todos = ['책 읽기', '운동하기', '코드 작성하기'];

  TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 목록')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(todos[i]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoDetailScreen(todo: todos[i]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final String todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 상세')),
      body: Center(
        child: Text('선택한 할 일: $todo', style: TextStyle(fontSize: 28)),
      ),
    );
  }
}
