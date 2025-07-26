import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(FirestoreTodoApp());

class FirestoreTodoApp extends StatelessWidget {
  const FirestoreTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirestoreTodoScreen(),
    );
  }
}

class FirestoreTodoScreen extends StatefulWidget {
  const FirestoreTodoScreen({super.key});

  @override
  State<FirestoreTodoScreen> createState() => _FirestoreTodoScreenState();
}

class _FirestoreTodoScreenState extends State<FirestoreTodoScreen> {
  final TextEditingController _controller = TextEditingController();
  final CollectionReference todos = FirebaseFirestore.instance.collection('todos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore 할 일 예제')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: '할 일을 입력하세요'),
                  ),
                ),
                ElevatedButton(
                  child: Text('추가'),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      todos.add({
                        'title': _controller.text.trim(),
                        'createdAt': FieldValue.serverTimestamp(),
                      });
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: todos.orderBy('createdAt', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final data = docs[i].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['title'] ?? ''),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => docs[i].reference.delete(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}