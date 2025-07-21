import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TodoListApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Todo {
  String text;
  bool done;
  Todo({required this.text, this.done = false});
}

class TodoListApp extends StatefulWidget {
  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final _controller = TextEditingController();
  final List<Todo> _todos = [];

  void _addTodo() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _todos.add(Todo(text: text));
      _controller.clear();
    });
  }

  void _toggleDone(int i, bool? value) {
    setState(() {
      _todos[i].done = value ?? false;
    });
  }

  void _removeTodo(int i) {
    setState(() {
      _todos.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 리스트')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: '할 일 입력'),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _addTodo, child: Text('추가')),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: _todos.isEmpty
                  ? Center(child: Text('할 일이 없습니다.'))
                  : ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, i) => ListTile(
                        leading: Checkbox(
                          value: _todos[i].done,
                          onChanged: (v) => _toggleDone(i, v),
                        ),
                        title: Text(
                          _todos[i].text,
                          style: TextStyle(
                            decoration: _todos[i].done
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeTodo(i),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
