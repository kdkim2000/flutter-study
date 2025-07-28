# 모바일 앱 개발자를 위한 Flutter(플러터) 제대로 배우기

이 문서는 "모바일 앱 개발자를 위한 Flutter(플러터) 제대로 배우기" 마인드맵 기반으로 정리한 교재입니다.

---

## 📘 Dart 기초

### ✅ Null Safety

- 변수에 null이 입력되지 못하도록 방지하고, 필요 시 명확히 표현하도록 지원합니다.
- 예제:

```dart
int age;

age = getAge();

if(age != null){
   if(age > 19)
}
```

- 클래스 내부의 멤버 변수(프로퍼티)는 사용 전에 반드시 초기화되어야 합니다.
- `int?` : null 허용 변수 선언
- `!` : null 아님을 확신할 때 사용
- `late`
  - 클래스의 멤버 변수를 나중에 초기화할 수 있도록 선언
  - 초기값으로 함수를 지정하면 해당 함수는 멤버변수가 처음 참조될 때까지 실행을 지연시킴

---

## 📱 앱 구조

### 위젯 분류

#### StatelessWidget

- 상태가 없는 위젯
- 클래스 내부에 변수가 없음
- 화면 변화가 없는 정적인 앱

#### StatefulWidget

- 상태가 있는 위젯
- 클래스 내부에 변수가 있음
- 화면 변화가 있는 동적인 앱

```dart
MyApp extends StatelessWidget
  → build() → MyHomePage extends StatefulWidget
    → createState()
      → _MyHomePageState extends State<MyHomePage>
        → build(), 변수 등
```

---

## 🧱 기본 위젯

### Stack

- 여러 위젯을 겹쳐서 표시
- 먼저 선언된 위젯이 아래로 감
- 이미지 + 라벨 구현 가능

### SingleChildScrollView

- 자식 위젯이 화면을 초과할 경우 스크롤 가능

### ListView, ListTile

- 리스트 목록을 구성
- 각 항목 세부 내용은 ListTile로 표현

### GridView

- 자식 위젯을 그리드 형태로 표시
- 열 수 지정 가능

### PageView

- 여러 페이지를 좌우로 넘겨볼 수 있음

### TabBar

- 하나의 화면을 여러 탭으로 구성

### BottomNavigationBar

- 하단 메뉴 구성

---

## 📐 위치, 크기, 정렬 위젯

- `Center`: 중앙 정렬
- `Padding`: 위젯 주위에 여백 부여
- `Align`: 정렬 위치 지정
- `Expanded`: 위젯 크기 비율 조정
- `SizedBox`: 특정 크기 지정
- `Card`: 카드 스타일 컨테이너

---

## 🔘 버튼 위젯

- `RaisedButton`: 입체형 버튼
- `FlatButton`: 평면 버튼 (deprecated → TextButton 권장)
- `IconButton`: 아이콘 버튼
- `FloatingActionButton`: 플로팅 액션 버튼

---

## 🧩 기타 위젯

- `Text`: 텍스트 표시
- `Image`
  - `Image.asset()`: 로컬 이미지
  - `Image.network()`: URL 이미지
- `Progress`: 대기 상태 표시
  - `CircularProgressIndicator()`
- `CircleAvatar`: 원형 이미지 혹은 아이콘

---

> 본 자료는 Flutter 입문자를 위한 교재로, 마인드맵 기반 내용을 Markdown 형식으로 정리한 것입니다.
