import 'package:flutter/material.dart';
import 'todo_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TodoItem> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo(String title) {
    setState(() {
      _todos.add(TodoItem(id: DateTime.now().toString(), title: title));
    });
    _controller.clear();
  }

  void _toggleTodo(String id, bool? value) {
    setState(() {
      final idx = _todos.indexWhere((t) => t.id == id);
      if (idx != -1) _todos[idx].completed = value ?? false;
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((t) => t.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 목록')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: '할 일을 입력하세요'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      _addTodo(_controller.text.trim());
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, i) {
                final todo = _todos[i];
                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (v) => _toggleTodo(todo.id, v),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTodo(todo.id),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
