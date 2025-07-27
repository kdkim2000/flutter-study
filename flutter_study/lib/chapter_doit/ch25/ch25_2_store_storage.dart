import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import '../../firebase_options.dart'; // 본인의 경로에 맞게 설정

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class Content {
  String content;
  String date;

  Content({
    required this.content,
    required this.date,
  });

  Content.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'content': content,
        'date': date,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Text Only',
      initialRoute: '/list',
      routes: {
        '/list': (context) => const ListScreen(),
        '/input': (context) => const InputScreen(),
      },
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contentsRef = FirebaseFirestore.instance
        .collection('contents')
        .withConverter<Content>(
          fromFirestore: (snapshots, _) =>
              Content.fromJson(snapshots.data()!),
          toFirestore: (content, _) => content.toJson(),
        );

    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Text List')),
      body: StreamBuilder<QuerySnapshot<Content>>(
        stream: contentsRef.orderBy('date', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final item = docs[index].data();
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(item.content),
                  subtitle: Text(item.date),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/input'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final controller = TextEditingController();

  Future<void> _save() async {
    final content = controller.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('내용을 입력해주세요.')),
      );
      return;
    }

    final newDoc = Content(
      content: content,
      date: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    );

    await FirebaseFirestore.instance
        .collection('contents')
        .add(newDoc.toJson());

    Navigator.pop(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('텍스트 입력'),
        actions: [
          IconButton(onPressed: _save, icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: controller,
          maxLines: null,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '내용을 입력하세요',
          ),
        ),
      ),
    );
  }
}
