# 3장: Flutter 프로젝트 구조와 위젯

---

## 3.1 Flutter 프로젝트 폴더 구조

Flutter 프로젝트를 만들면 다양한 폴더와 파일이 자동으로 생성됩니다. 각 폴더의 역할을 이해하면 앱 구조를 더 쉽게 파악할 수 있습니다.

```

my\_first\_flutter/
│
├─ android/      # 안드로이드 네이티브 관련 파일
├─ ios/          # iOS 네이티브 관련 파일
├─ web/          # 웹 빌드 관련 파일 (선택)
├─ windows/      # 윈도우 앱 빌드 관련 파일 (선택)
├─ linux/        # 리눅스 앱 빌드 관련 파일 (선택)
├─ macos/        # 맥OS 앱 빌드 관련 파일 (선택)
├─ lib/          # Flutter/Dart 소스코드 (핵심 폴더)
│   └─ main.dart # 앱 시작점
├─ test/         # 테스트 코드 폴더
├─ pubspec.yaml  # 앱 메타정보, 패키지 관리 파일
└─ README.md     # 프로젝트 설명 파일

````

- **lib/** 폴더: 실제 앱의 Dart 코드 작성
- **main.dart**: 모든 Flutter 앱의 진입점, 앱의 시작 위치
- **pubspec.yaml**: 의존 패키지, 이미지, 폰트 등 앱 자원 관리
- **test/**: 단위 테스트용 파일

---

## 3.2 Flutter 앱의 실행 흐름

모든 Flutter 앱은 `main()` 함수에서 시작하여,  
`runApp()` 함수에 **최상위 위젯**을 전달합니다.

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Demo')),
        body: Center(child: Text('Hello, Flutter!')),
      ),
    );
  }
}
````

* `runApp(...)`: 최상위 위젯(MyApp)을 화면에 그린다.
* 모든 UI는 \*\*위젯(Widget)\*\*으로 구성된다.

---

## 3.3 위젯(Widget)이란?

* 위젯은 Flutter UI의 모든 것!
* 화면의 글자, 버튼, 이미지, 리스트 등 모두 위젯
* 위젯은 계층 구조(트리 구조)로 조합

**예시**
`Text` 위젯은 글자,
`Row`, `Column`은 레이아웃,
`Scaffold`는 페이지 뼈대,
`MaterialApp`은 앱 전체 스타일/라우팅

---

## 3.4 주요 위젯 따라해 보기

### 3.4.1 Text

```dart
Text(
  '안녕하세요, Flutter!',
  style: TextStyle(
    fontSize: 24,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)
```

---

### 3.4.2 Column & Row (수직/수평 배치)

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('첫 줄'),
    Text('둘째 줄'),
    ElevatedButton(
      onPressed: () {},
      child: Text('버튼'),
    ),
  ],
)
```

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.star),
    Text('별'),
    Icon(Icons.favorite),
  ],
)
```

---

### 3.4.3 Container (레이아웃/박스)

```dart
Container(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(horizontal: 20),
  color: Colors.amber,
  child: Text('Container 안의 텍스트'),
)
```

---

### 3.4.4 Image

```dart
Image.network(
  'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
  width: 120,
  height: 40,
)
```

---

### 3.4.5 버튼 (ElevatedButton, TextButton, IconButton 등)

```dart
ElevatedButton(
  onPressed: () {
    print('버튼 클릭!');
  },
  child: Text('눌러보세요'),
)
```

```dart
IconButton(
  onPressed: () {},
  icon: Icon(Icons.thumb_up),
)
```

---

### 3.4.6 입력 위젯 (TextField)

```dart
TextField(
  decoration: InputDecoration(
    labelText: '이름',
    border: OutlineInputBorder(),
  ),
)
```

---

### 3.4.7 리스트(ListView)

```dart
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.person),
      title: Text('홍길동'),
      subtitle: Text('개발자'),
    ),
    ListTile(
      leading: Icon(Icons.person),
      title: Text('김영희'),
      subtitle: Text('디자이너'),
    ),
  ],
)
```

---

## 3.5 실습: 내 프로필 카드 만들기

아래 예제를 직접 복사해서 `main.dart`에 붙여넣고 실행해보세요.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('내 프로필 카드')),
        body: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                ),
                SizedBox(height: 16),
                Text('홍길동', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Flutter 개발자', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('hong@example.com'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

* **직접 이름, 이메일, 직업을 바꿔보세요!**
* 이미지는 원하는 URL로 바꿀 수 있습니다.

---

## 3.6 Scaffold란?

페이지 뼈대를 만들어주는 Flutter의 기본 위젯입니다.
앱의 상단바(AppBar), 본문(Body), 하단바(BottomNavigationBar) 등을 쉽게 구현할 수 있습니다.

```dart
Scaffold(
  appBar: AppBar(title: Text('타이틀')),
  body: Center(child: Text('본문')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

---

## 3.7 위젯의 트리(계층 구조) 이해

Flutter의 UI는 부모-자식 관계로 트리(Tree)처럼 구성됩니다.

```
MaterialApp
  └─ Scaffold
      ├─ AppBar
      ├─ Body
          └─ Center
              └─ Column
                  ├─ Text
                  └─ ElevatedButton
```

* 위젯은 계층적으로 조합할수록 강력한 UI를 만들 수 있습니다.

---

## 3.8 StatelessWidget vs StatefulWidget

### StatelessWidget

* 상태가 없는(값이 변하지 않는) 위젯
* 항상 같은 UI만 그림

```dart
class MyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('상태가 없는 위젯');
  }
}
```

### StatefulWidget

* 상태(값/변수)가 변경될 수 있는 위젯
* setState() 호출 시 화면이 갱신됨

```dart
class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('버튼을 누른 횟수: $_count'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('증가'),
        ),
      ],
    );
  }
}
```

---

## 3.9 실습: 버튼 클릭시 카운터 증가 앱

아래 코드를 복사해서 실행해 보세요.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('카운터 예제')),
        body: Center(child: CounterPage()),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_count', style: TextStyle(fontSize: 48)),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _increment,
          child: Text('증가'),
        ),
      ],
    );
  }
}
```

* **설명**

  * `_count` 값이 `setState()`로 변하면 자동으로 UI가 갱신됨

---

## 3.10 참고: Flutter 위젯 공식 문서/도구

* [Flutter 공식 위젯 카탈로그](https://docs.flutter.dev/ui/widgets)
* [Flutter Widget of the Week (YouTube)](https://www.youtube.com/playlist?list=PLjxrf2q8roU3ahJVrSgAnPjzkpGmL9Czl)
* [DartPad 실습 환경](https://dartpad.dev/)

---

## 3장 마무리

이 장에서는 Flutter 앱의 구조와 다양한 기본 위젯,
Stateless/Stateful 위젯의 차이,
실제 예제까지 함께 경험했습니다.

다음 장에서는 더 다양한 레이아웃과 화면 배치 방법을 배워보겠습니다.


