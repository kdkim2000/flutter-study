# 8장: Firebase 연동

---

## 8.1 Firebase란?

- **Firebase**는 Google에서 제공하는 클라우드 백엔드 플랫폼입니다.
- 데이터베이스, 인증, 스토리지, 푸시 알림 등 다양한 기능을 무료 또는 저렴하게 제공
- Flutter와 쉽게 연동 가능

대표 서비스
- Firestore(실시간 데이터베이스)
- Authentication(로그인/회원관리)
- Storage(파일 업로드)
- Analytics, Crashlytics 등

---

## 8.2 사전 준비: Google 계정 및 Flutter 프로젝트

1. Google 계정으로 [Firebase 콘솔](https://console.firebase.google.com/)에 로그인
2. Flutter 프로젝트(앱)는 Android Studio에서 미리 생성해 두기

---

## 8.3 Firebase 프로젝트 생성 및 앱 등록

### 8.3.1 Firebase 프로젝트 만들기

1. Firebase 콘솔 → `프로젝트 추가` 클릭
2. 프로젝트 이름 입력 (예: my_flutter_todo)
3. Google Analytics는 나중에 사용해도 OK
4. [계속]을 눌러 프로젝트 생성 완료

### 8.3.2 Android 앱 등록

1. ‘앱 추가’ → Android 선택
2. **Android 패키지명**:  
   - Flutter 프로젝트의 `android/app/src/main/AndroidManifest.xml`에서  
     `<application>` 위쪽의 `package="..."` 값 복사
   - 예시: `com.example.my_flutter_todo`
3. 앱 닉네임(선택), 디버그 서명(생략 가능)
4. [앱 등록] → google-services.json 파일 다운로드  
   - **이 파일을 Flutter 프로젝트의 `android/app/` 폴더에 복사**

### 8.3.3 Firebase SDK 설정

1. `android/build.gradle` 파일에 아래 추가(plugins 섹션)
   ```gradle
   classpath 'com.google.gms:google-services:4.3.15'
````

2. `android/app/build.gradle` 맨 아래에 추가

   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```
3. 저장 후 Android Studio에서 ‘Sync Now’ 클릭

### 8.3.4 iOS/웹 연동은 pub.dev 가이드 참고

---

## 8.4 Flutter에 Firebase 연동하기

### 8.4.1 패키지 설치

pubspec.yaml에 다음 추가

```yaml
dependencies:
  firebase_core: ^2.31.0
  cloud_firestore: ^4.16.1
  # (추가로 필요한 경우: firebase_auth, firebase_storage 등)
```

터미널에서

```
flutter pub get
```

실행

---

### 8.4.2 Flutter 코드에 Firebase 초기화

`main.dart` 코드 예시

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // 자동 생성 파일 (아래 참고)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // 필수!
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase 연동 예제',
      home: MyHomePage(),
    );
  }
}
```

---

### 8.4.3 firebase\_options.dart 생성

최신 FlutterFire CLI로 아래와 같이 자동 생성합니다.

1. 터미널에서

   ```
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
2. 안내에 따라 Firebase 프로젝트 선택, 플랫폼(Android/iOS 등) 체크
3. 프로젝트 루트에 `firebase_options.dart` 파일이 생성됨

---

## 8.5 Firestore로 간단한 데이터 읽고 쓰기

### 8.5.1 Firestore란?

* 클라우드 기반 실시간 NoSQL 데이터베이스
* 데이터 구조: 컬렉션(collection) > 문서(document)

---

### 8.5.2 예제: 할 일(ToDo) 추가/읽기

**pubspec.yaml**에 cloud\_firestore 추가(위 참고)

```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(FirestoreTodoApp());

class FirestoreTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirestoreTodoScreen(),
    );
  }
}

class FirestoreTodoScreen extends StatefulWidget {
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
```

* Firestore의 데이터를 실시간으로 읽어와 리스트로 출력
* 할 일 입력 후 "추가" 버튼을 누르면 Firestore에 저장
* 각 할 일의 삭제 버튼을 누르면 Firestore에서 해당 문서 삭제

---

## 8.6 실습: 인증(Authentication) 연동(간단 소개)

* Firebase Authentication으로 구글/이메일 등 로그인 구현 가능
* 자세한 연동은 [공식 가이드](https://firebase.flutter.dev/docs/auth/overview) 참고

---

## 8.7 Firebase와 Flutter 실전 팁

* Firestore 데이터는 항상 ‘컬렉션 > 문서’ 구조
* 실시간 데이터 변경 감지는 StreamBuilder로 처리
* 보안 규칙은 Firebase 콘솔에서 설정(개발 중은 테스트 규칙, 실제 배포는 보안 강화!)
* 에뮬레이터에서 먼저 테스트 가능

---

## 8.8 자주 묻는 질문(FAQ)

* Q: Firebase 연결 후 에러(google-services.json 문제 등)

  * → json 파일 경로가 정확한지, build.gradle 수정이 올바른지 체크
* Q: 실시간 데이터가 안 보임

  * → StreamBuilder 사용 여부, 쿼리 문법 확인
* Q: iOS에서 빌드 에러

  * → Xcode에서 CocoaPods 설치(`pod install`), Info.plist 수정 필요

---

## 8.9 참고 자료

* [FlutterFire 공식 문서](https://firebase.flutter.dev/)
* [Firestore Flutter Codelab](https://firebase.google.com/codelabs/firebase-get-to-know-flutter#0)
* [공식 예제](https://github.com/FirebaseExtended/flutterfire)

---

## 8장 마무리

이 장에서는 Firebase와 Flutter를 연동하고,
Firestore 데이터베이스에 데이터를 저장하고 읽는 방법을 실습했습니다.

다음 장에서는 지금까지 배운 모든 내용을 활용해
실제 할 일 목록(ToDo) 앱을 완성해봅니다.
