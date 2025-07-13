# 5장: 상태 관리(State)와 예제

---

## 5.1 상태(State)란 무엇인가?

- **상태(State)**란 앱의 “현재 값” 또는 “데이터의 변화”를 의미합니다.
- 예) 버튼을 몇 번 눌렀는지, 체크박스의 체크 여부, 입력 폼의 값 등.
- **상태 관리**는 앱이 사용자와 상호작용하며 데이터가 변할 때 화면(UI)도 자동으로 반영되도록 하는 방식입니다.

---

## 5.2 StatelessWidget vs StatefulWidget

- **StatelessWidget**: 상태가 없는(값이 변하지 않는) 위젯. 한 번 그려진 후 값이 변하지 않음.
- **StatefulWidget**: 상태가 있고, setState()로 값이 바뀌면 화면이 다시 그림(리빌드)됨.

### 예시 비교

```dart
// StatelessWidget 예시
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('항상 같은 텍스트');
  }
}
````

```dart
// StatefulWidget 예시 (카운터)
class MyCounter extends StatefulWidget {
  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _count = 0;

  void _increase() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_count', style: TextStyle(fontSize: 40)),
        ElevatedButton(onPressed: _increase, child: Text('증가')),
      ],
    );
  }
}
```

---

## 5.3 setState의 원리

* `setState()` 함수 안에서 값을 변경하면 Flutter가 해당 위젯을 다시 그려줍니다(리빌드).
* 화면(UI)과 상태(State)가 항상 일치하게 유지됩니다.

> **실습**
> 아래 예제를 main.dart에 붙여넣고 버튼을 누를 때마다 값이 바뀌는지 확인하세요.

```dart
import 'package:flutter/material.dart';

void main() => runApp(const StateDemoApp());

class StateDemoApp extends StatelessWidget {
  const StateDemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget 실습')),
        body: Center(child: MyCounter()),
      ),
    );
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});
  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _count = 0;

  void _increase() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_count', style: TextStyle(fontSize: 40)),
        SizedBox(height: 20),
        ElevatedButton(onPressed: _increase, child: Text('증가')),
        ElevatedButton(onPressed: _reset, child: Text('초기화')),
      ],
    );
  }
}
```

---

## 5.4 여러 위젯 간 상태 공유

* **StatefulWidget**만으로는 한 페이지(위젯)에서만 상태를 관리함
* 여러 위젯(여러 페이지)이 “같은 데이터”를 공유하려면 **상태 관리 패턴** 필요

---

## 5.5 상태 관리의 종류

Flutter에서는 다양한 상태 관리 라이브러리가 존재합니다.

* 기본: setState (StatefulWidget 내부)
* 상위 → 하위 위젯 전달: **InheritedWidget**
* 가장 널리 쓰는 방식: **Provider** 패키지 (공식 추천)
* 그 외: Riverpod, Bloc, GetX 등

이 장에서는 **Provider**를 집중적으로 다룹니다.

---

## 5.6 Provider로 상태 관리 시작하기

### 1) Provider 패키지 설치

* pubspec.yaml의 dependencies에 아래 추가

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
```

* 터미널에서 `flutter pub get` 실행

---

### 2) Provider 기본 구조

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 상태 데이터 클래스 (ChangeNotifier 상속)
class CounterModel extends ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners(); // 값이 바뀌면 UI에 알림
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Provider 카운터')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${counter.count}', style: TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: counter.increase,
              child: Text('증가'),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### 주요 포인트

* `ChangeNotifierProvider`: 앱 전체에 상태 데이터(CounterModel)를 공급
* `ChangeNotifier`: 데이터가 바뀌면 화면 갱신을 알릴 수 있음
* `Provider.of<T>(context)`: 현재 데이터 읽어오기

---

## 5.7 Consumer로 성능 높이기

* Provider를 사용할 때 **Consumer 위젯**을 활용하면,
  해당 부분만 선택적으로 리빌드할 수 있어 성능상 유리

```dart
Consumer<CounterModel>(
  builder: (context, counter, child) {
    return Text('${counter.count}', style: TextStyle(fontSize: 40));
  },
),
```

---

## 5.8 실습: 할 일(ToDo) 리스트의 상태 관리

### 1) 데이터 모델 정의

```dart
import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  List<String> todos = [];

  void addTodo(String todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
```

### 2) Provider로 앱 전체에서 관리

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: TodoApp(),
    ),
  );
}
```

### 3) UI에서 할 일 추가/삭제

```dart
class TodoScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 관리')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: '할 일 입력'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      Provider.of<TodoModel>(context, listen: false)
                          .addTodo(controller.text.trim());
                      controller.clear();
                    }
                  },
                  child: Text('추가'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoModel>(
              builder: (context, todoModel, child) => ListView.builder(
                itemCount: todoModel.todos.length,
                itemBuilder: (context, i) => ListTile(
                  title: Text(todoModel.todos[i]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () =>
                        todoModel.removeTodo(i),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 5.9 상태 관리 실전 미션

1. 카운터 앱에 “감소” 버튼과 “초기화” 버튼을 추가해보세요.
2. 할 일 리스트 예제에서, 완료 여부(체크박스)를 관리해보세요.

---

## 5.10 자주 묻는 질문(FAQ)

* Q: setState와 Provider의 차이는?

  * setState는 위젯 내부에서만 상태 변경, Provider는 여러 위젯/페이지에서 데이터 공유 및 변경 가능.
* Q: Provider 외에 어떤 방법이 있나요?

  * Riverpod, Bloc, GetX 등 다양한 패턴이 있지만 초보자는 Provider부터 익히면 충분.

---

## 5장 마무리

이 장에서는 Flutter의 상태 관리 원리, StatefulWidget, setState 사용법,
그리고 Provider를 활용한 앱 전체 상태 공유법을 배웠습니다.

다음 장에서는 화면 간 이동(라우팅)과 데이터 전달을 배웁니다.

