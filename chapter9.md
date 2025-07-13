# 9장: 실전 – 할 일 목록(ToDo) 앱 만들기

---

## 9.1 앱 기획과 목표

이번 장에서는 지금까지 배운 내용을 바탕으로  
**실제로 쓸 수 있는 ‘할 일 목록(ToDo) 앱’**을 완성합니다.

- 할 일 추가/삭제/완료 체크
- Firebase Firestore에 실시간 저장
- 파일별 구조와 역할 분리
- 초보자도 확장 가능하도록 상세 주석

---

## 9.2 설계: 앱 구조 한눈에 보기

```

lib/
main.dart             # 앱 진입점, Firebase 초기화, MaterialApp 설정
todo\_item.dart        # 할 일 데이터 모델 클래스
todo\_list\_page.dart   # 할 일 목록 UI/기능 메인 화면
add\_todo\_dialog.dart  # 할 일 추가 다이얼로그
(firebase\_options.dart) # Firebase 설정 (자동 생성)

````

- Firestore 컬렉션: `todos`
  - 각 문서: {title, completed, createdAt}

---

## 9.3 파일별 상세 설명 및 코드

---

### 1) main.dart

앱의 시작점.  
Firebase 초기화와 MaterialApp 설정, 홈 화면 지정

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // flutterfire configure로 생성
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
````

---

### 2) todo\_item.dart

할 일(Todo) 데이터 구조 모델

```dart
class TodoItem {
  final String id;      // Firestore 문서 ID
  final String title;   // 할 일 제목
  bool completed;       // 완료 여부

  TodoItem({
    required this.id,
    required this.title,
    this.completed = false,
  });

  // Firestore에서 읽어오기 (Map -> 객체)
  factory TodoItem.fromMap(String id, Map<String, dynamic> data) {
    return TodoItem(
      id: id,
      title: data['title'] ?? '',
      completed: data['completed'] ?? false,
    );
  }

  // Firestore로 저장(Map)
  Map<String, dynamic> toMap() {
    return {'title': title, 'completed': completed};
  }
}
```

---

### 3) add\_todo\_dialog.dart

할 일을 입력하는 다이얼로그
(코드의 재사용성, UI 분리를 위해 별도 파일로 분리)

```dart
import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String) onAdd;
  const AddTodoDialog({required this.onAdd, super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  String _title = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('할 일 추가'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(hintText: '할 일 입력'),
        onChanged: (value) => setState(() => _title = value),
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            widget.onAdd(value.trim());
            Navigator.pop(context);
          }
        },
      ),
      actions: [
        TextButton(
          child: Text('취소'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('추가'),
          onPressed: () {
            if (_title.trim().isNotEmpty) {
              widget.onAdd(_title.trim());
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
```

---

### 4) todo\_list\_page.dart

할 일 목록을 보여주고, Firestore와 실시간 연동
할 일 추가, 완료 토글, 삭제 기능 포함

```dart
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
```

---

## 9.4 앱 실행 예시

* 앱을 실행하면 할 일 목록이 표시됩니다(처음엔 비어있음)
* * 버튼 → 다이얼로그에서 할 일을 입력 후 추가
* 체크박스 클릭 시 완료 상태 토글(취소선/회색 처리)
* 슬라이드/휴지통 아이콘으로 삭제
* Firestore에 실시간 저장/동기화

---

## 9.5 트러블슈팅 & 자주 묻는 질문

* **Q: Firebase 연동 에러, google-services.json 못 찾음**

  * 파일이 `android/app` 폴더에 정확히 있는지 확인
* **Q: Firestore 실시간 데이터가 안 나와요!**

  * StreamBuilder와 컬렉션/문서 이름 확인, 보안 규칙 임시 완화
* **Q: 할 일 추가/삭제 후 바로 반영 안됨**

  * `createdAt` 필드를 반드시 저장, orderBy 사용
* **Q: 앱이 켜질 때마다 Firebase 초기화 에러**

  * `main()` 함수에서 `WidgetsFlutterBinding.ensureInitialized();` 추가
* **Q: 코드가 너무 길고 복잡해요**

  * 파일별로 역할을 분리, 주석 참고

---

## 9.6 미션 & 확장 과제

* 할 일에 마감일(date) 추가/수정해보기
* 할 일 우선순위(별점, 색상) 추가
* Firestore에서 사용자별 할 일 관리(로그인 연동)
* 할 일 목록 검색/필터 기능 추가

---

## 9.7 참고자료

* [Flutter 공식 ToDo 예제](https://github.com/flutter/samples/tree/main/provider_shopper)
* [Firebase 공식 문서](https://firebase.flutter.dev/)

---

## 9장 마무리

여기까지 따라왔다면,
실제 앱 배포까지 가능한 “풀스택” Flutter 개발자가 될 준비가 된 것입니다!

수고하셨습니다! 🎉

