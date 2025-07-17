# 4장: Flutter 레이아웃과 화면구성

---

## 4.1 Flutter 레이아웃 시스템 이해하기

Flutter에서 UI를 만드는 가장 핵심적인 개념은 **레이아웃(Layout)** 입니다.  
Flutter의 모든 화면은 **위젯의 트리 구조**로 배치하며,  
이때 사용하는 대표적인 레이아웃 위젯에는 **Row, Column, Container, Expanded, Flexible** 등이 있습니다.

---

## 4.2 Column과 Row: 수직/수평 배치

### 4.2.1 Column

- **Column** 위젯은 자식 위젯들을 **위에서 아래로(수직)** 배치합니다.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center, // 세로 방향 정렬
  crossAxisAlignment: CrossAxisAlignment.start, // 가로 방향 정렬
  children: [
    Text('첫 번째 줄'),
    Text('두 번째 줄'),
    ElevatedButton(
      onPressed: () {},
      child: Text('버튼'),
    ),
  ],
)
````

* `mainAxisAlignment`: 주축(수직) 정렬 방식
* `crossAxisAlignment`: 교차축(수평) 정렬 방식

---

### 4.2.2 Row

* **Row** 위젯은 자식 위젯들을 **왼쪽에서 오른쪽(수평)** 으로 배치합니다.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 수평 정렬
  children: [
    Icon(Icons.star),
    Text('별'),
    Icon(Icons.favorite),
  ],
)
```

* `mainAxisAlignment`: 주축(수평) 정렬
* `crossAxisAlignment`: 교차축(수직) 정렬

---

### 4.2.3 실습: Row & Column 섞어서 써보기

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Row & Column 예제')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 32),
                SizedBox(width: 10),
                Text('홈 화면', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('A')),
                ElevatedButton(onPressed: () {}, child: Text('B')),
                ElevatedButton(onPressed: () {}, child: Text('C')),
              ],
            )
          ],
        ),
      ),
    ),
  ));
}
```

---

## 4.3 Container: 레이아웃과 스타일의 기본 박스

**Container**는 Flutter에서 가장 많이 사용하는 레이아웃 위젯입니다.
박스(영역)를 만들고, 여기에 스타일, 여백, 크기 등을 줄 수 있습니다.

```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),           // 안쪽 여백
  margin: EdgeInsets.symmetric(vertical: 12), // 바깥 여백
  decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(16), // 둥근 테두리
    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)],
  ),
  child: Text(
    '이것은 Container입니다',
    style: TextStyle(fontSize: 18),
  ),
)
```

---

## 4.4 Expanded와 Flexible: 공간 분할과 자동 크기 조절

### 4.4.1 Expanded

* `Expanded`는 **Row/Column**의 남은 공간을 자식 위젯이 "자동으로" 채우게 해줍니다.

```dart
Row(
  children: [
    Expanded(
      child: Container(color: Colors.blue, height: 50),
    ),
    Expanded(
      child: Container(color: Colors.red, height: 50),
    ),
  ],
)
```

* 위 예제에서는 두 컨테이너가 동일하게 넓이를 차지

### 4.4.2 Flexible

* `Flexible`은 자식 위젯이 "원하는 만큼" 공간을 쓰게 하며, 필요시 줄거나 늘어납니다.

```dart
Row(
  children: [
    Flexible(
      flex: 2,
      child: Container(color: Colors.green, height: 50),
    ),
    Flexible(
      flex: 1,
      child: Container(color: Colors.yellow, height: 50),
    ),
  ],
)
```

* `flex` 값에 따라 공간 배분 비율이 결정 (2:1)

---

## 4.5 SizedBox와 Spacer: 빈 공간/간격 만들기

* **SizedBox**: 고정 크기의 공간을 만듦
* **Spacer**: Row/Column에서 자동으로 남는 공간을 분배

```dart
Column(
  children: [
    Text('윗줄'),
    SizedBox(height: 20), // 20픽셀 간격
    Text('아랫줄'),
  ],
)
```

```dart
Row(
  children: [
    Icon(Icons.arrow_back),
    Spacer(), // 남는 공간을 모두 차지
    Icon(Icons.arrow_forward),
  ],
)
```

---

## 4.6 실습: 카드 형태의 리스트 만들기

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('카드 리스트')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MyCard(title: '첫 번째 카드', icon: Icons.star, color: Colors.orange),
          MyCard(title: '두 번째 카드', icon: Icons.favorite, color: Colors.red),
          MyCard(title: '세 번째 카드', icon: Icons.thumb_up, color: Colors.blue),
        ],
      ),
    ),
  ));
}

class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const MyCard({required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: color, size: 36),
        title: Text(title, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
```

---

## 4.7 Stack: 겹치기 레이아웃

* **Stack** 위젯은 여러 위젯을 겹쳐서 배치할 수 있습니다.

```dart
Stack(
  alignment: Alignment.center,
  children: [
    Container(width: 150, height: 150, color: Colors.blue),
    Container(width: 100, height: 100, color: Colors.green.withOpacity(0.7)),
    Text('Stack 위젯', style: TextStyle(color: Colors.white, fontSize: 20)),
  ],
)
```

---

## 4.8 SingleChildScrollView와 ListView: 스크롤 가능한 레이아웃

* **SingleChildScrollView**: 한 개의 긴 위젯을 스크롤
* **ListView**: 리스트 형식의 스크롤(많이 사용)

```dart
SingleChildScrollView(
  child: Column(
    children: List.generate(
      20,
      (i) => Padding(
        padding: EdgeInsets.all(8),
        child: Text('항목 $i', style: TextStyle(fontSize: 18)),
      ),
    ),
  ),
)
```

```dart
ListView.builder(
  itemCount: 50,
  itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.list),
      title: Text('아이템 $index'),
    );
  },
)
```

---

## 4.9 실습: 반응형 레이아웃 만들기

* **MediaQuery**를 이용해 화면 크기에 따라 위젯 배치를 달리할 수 있습니다.

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyResponsiveApp());

class MyResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isWide = width > 600;

    return Scaffold(
      appBar: AppBar(title: Text('반응형 레이아웃')),
      body: isWide
          ? Row(
              children: [
                Expanded(child: Container(color: Colors.blue, child: Center(child: Text('왼쪽')))),
                Expanded(child: Container(color: Colors.green, child: Center(child: Text('오른쪽')))),
              ],
            )
          : Column(
              children: [
                Expanded(child: Container(color: Colors.blue, child: Center(child: Text('위')))),
                Expanded(child: Container(color: Colors.green, child: Center(child: Text('아래')))),
              ],
            ),
    );
  }
}
```

---

## 4.10 레이아웃 실전 미션

1. Column, Row, Container, Expanded를 자유롭게 조합해서
   “3단 구역(헤더-본문-푸터)”을 만들어 보세요.
2. 각 구역에 다른 색상과 아이콘, 텍스트를 배치해보세요.
3. 직접 크기, 정렬, 여백 등을 조정해보세요.

---

## 4장 마무리

이 장에서는 Flutter의 다양한 레이아웃 위젯(Column, Row, Container, Expanded 등)을
실제 코드와 예제 중심으로 배웠습니다.
레이아웃 위젯은 Flutter 앱 개발의 핵심이므로,
여러 예제를 따라하며 익숙해지는 것이 중요합니다.

다음 장에서는 화면의 상태 관리와 데이터 흐름(State Management)에 대해 다룹니다.


