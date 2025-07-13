# 6장: 화면 전환과 라우팅

---

## 6.1 라우팅(Routing)이란?

- **라우팅(Routing)**이란 여러 화면(페이지)으로 구성된 앱에서  
  “어떤 화면을 보여줄지” 결정하고, 화면 간 전환을 제어하는 것
- 웹의 “URL 이동”, 네이티브 앱의 “화면 이동”과 같은 개념

Flutter에서는 **Navigator**와 **Route** 객체를 사용해  
화면 전환을 쉽게 구현할 수 있습니다.

---

## 6.2 가장 기본적인 화면 전환: Navigator

### 6.2.1 Navigator란?

- Flutter에서 페이지 이동(전환) 기능을 제공하는 위젯/객체
- **스택(Stack)** 구조로,  
  - push: 새 화면을 스택에 쌓기  
  - pop: 마지막(맨 위) 화면을 스택에서 빼기

---

### 6.2.2 가장 단순한 예제

아래 코드를 복사해서 main.dart에 붙여넣고 실행해보세요.

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyRoutingApp());

class MyRoutingApp extends StatelessWidget {
  const MyRoutingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '라우팅 기본',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('첫 번째 페이지')),
      body: Center(
        child: ElevatedButton(
          child: Text('다음 페이지로 이동'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('두 번째 페이지')),
      body: Center(
        child: ElevatedButton(
          child: Text('이전 페이지로 돌아가기'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
````

* `Navigator.push()` : 새 페이지로 이동(쌓기)
* `Navigator.pop()` : 이전 페이지로 돌아가기(빼기)

---

## 6.3 여러 화면 라우팅: routes 설정

많은 화면이 있을 때는 `MaterialApp`의 `routes` 옵션을 사용해
페이지를 “이름”으로 관리할 수 있습니다.

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '이름 기반 라우팅',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('홈')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('About 페이지로 이동'),
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
            ElevatedButton(
              child: Text('Profile 페이지로 이동'),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: ElevatedButton(
          child: Text('홈으로'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('프로필')),
      body: Center(
        child: ElevatedButton(
          child: Text('홈으로'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
```

* `routes`: Map 형식(이름 → 위젯)
* `initialRoute`: 앱 시작 시 보여줄 페이지
* `Navigator.pushNamed(context, '/about')`: 라우트 이름으로 이동

---

## 6.4 화면 전환시 데이터(인자) 전달하기

* 페이지 이동할 때 값을 함께 보내고 싶다면?
* `push` 시 인자를 넘겨주고, 새 페이지에서 받아서 사용!

### 6.4.1 예제: 이름을 전달하여 표시

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyArgApp());

class MyArgApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SendPage(),
    );
  }
}

class SendPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('데이터 전달(보내기)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: '이름을 입력하세요'),
            ),
            ElevatedButton(
              child: Text('다음 페이지로 전달'),
              onPressed: () {
                String name = controller.text.trim();
                if (name.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceivePage(name: name),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivePage extends StatelessWidget {
  final String name;

  const ReceivePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('데이터 전달(받기)')),
      body: Center(
        child: Text('안녕하세요, $name님!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
```

---

## 6.5 Navigator의 다양한 기능

* **pop() 결과값 반환**

  * 페이지에서 값을 돌려주고 싶을 때

```dart
// 1) SecondPage에서 값 반환
Navigator.pop(context, '돌아가는 값');

// 2) FirstPage에서 결과 받기
var result = await Navigator.push(...);
print('받은 값: $result');
```

* **화면 교체(pushReplacement)**

  * 새 화면을 띄우며 이전 화면을 제거

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NextPage()),
);
```

---

## 6.6 실전: 할 일(ToDo) 상세 페이지 만들어보기

ToDo 목록에서 할 일을 클릭하면 상세 정보 페이지로 이동하고,
할 일의 내용을 보여주는 기능을 만들어봅시다.

```dart
import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  final List<String> todos = ['책 읽기', '운동하기', '코드 작성하기'];

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
        child: Text(
          '선택한 할 일: $todo',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
```

---

## 6.7 실습 미션

1. 화면 전환 시, 여러 개의 값을 Map으로 전달해보세요.
2. 두 번째 페이지에서 첫 번째 페이지로 메시지를 돌려주는 코드를 작성해보세요.

---

## 6.8 자주 묻는 질문(FAQ)

* Q: Navigator.pop()을 여러 번 호출하면?

  * 스택에서 그만큼 이전 화면으로 돌아감.
    (앱의 첫 페이지에서 pop하면 앱 종료됨)
* Q: 앱 상단에 “뒤로가기” 아이콘이 자동으로 나오는 이유는?

  * Scaffold의 AppBar가 자동으로 처리.
* Q: 화면이 복잡해질수록 routes 방식과 Navigator 방식 중 어느 것이 더 좋은가?

  * 여러 화면을 체계적으로 관리하려면 routes와 NamedRoute를 활용,
    간단한 화면 전환은 Navigator.push 사용.

---

## 6장 마무리

이 장에서는 Flutter에서 여러 화면을 만드는 방법,
Navigator로 화면 전환하는 법,
데이터 전달 및 라우트 관리 방법까지 배웠습니다.

다음 장에서는 외부 패키지를 활용하여 앱의 기능을 확장해봅니다.
