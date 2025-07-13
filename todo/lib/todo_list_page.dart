import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'todo_item.dart';
import 'add_todo_dialog.dart';

class TodoListPage extends StatelessWidget {
  final CollectionReference todosRef =
  FirebaseFirestore.instance.collection('todos');

  TodoListPage({super.key});

  // Firestore 실시간 스트림
  Stream<List<TodoItem>> getTodos() {
    return todosRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => TodoItem.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList());
  }

  Future<void> addTodo(String title) async {
    await todosRef.add({
      'title': title,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> toggleTodo(TodoItem todo) async {
    await todosRef.doc(todo.id).update({'completed': !todo.completed});
  }

  Future<void> deleteTodo(TodoItem todo) async {
    await todosRef.doc(todo.id).delete();
  }

  void showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AddTodoDialog(
        onAdd: (title) async {
          await addTodo(title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('할 일 목록'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
            tooltip: '새로고침 (자동 갱신됨)',
          )
        ],
      ),
      body: StreamBuilder<List<TodoItem>>(
        stream: getTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('할 일이 없습니다. 추가해보세요!'));

          final todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, i) {
              final todo = todos[i];
              return Dismissible(
                key: ValueKey(todo.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 24),
                  child: Icon(Icons.delete, color: Colors.white, size: 32),
                ),
                onDismissed: (_) => deleteTodo(todo),
                child: ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (_) => toggleTodo(todo),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: todo.completed ? Colors.grey : Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteTodo(todo),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTodoDialog(context),
        child: Icon(Icons.add),
        tooltip: '할 일 추가',
      ),
    );
  }
}