# 7장: 외부 패키지 활용하기

---

## 7.1 외부 패키지란?

- **패키지(package)** 는 Flutter/Dart 개발에 필요한 기능들을  
  미리 만들어둔 코드(라이브러리)입니다.
- 대표적인 예: 네트워크 통신, 날짜 처리, 상태관리, 이미지 캐싱, 아이콘, 애니메이션 등
- **pub.dev**에서 공식·비공식 수만 개의 패키지를 무료로 이용할 수 있습니다.

---

## 7.2 pub.dev에서 패키지 검색/선택하기

1. [pub.dev](https://pub.dev/) 접속
2. 검색창에 원하는 기능(예: `http`, `url_launcher`, `provider`, `shared_preferences`)을 입력
3. 다운로드 수, 최근 업데이트, 점수 등을 참고하여 신뢰성 높은 패키지 선택

---

## 7.3 패키지 설치 방법

### 1) pubspec.yaml 파일 수정

예시: `url_launcher` 패키지 추가

```yaml
dependencies:
  flutter:
    sdk: flutter
  url_launcher: ^6.2.6
````

* 버전은 pub.dev에서 최신 권장 버전 확인

### 2) 패키지 설치

터미널에서 프로젝트 폴더 위치에서 아래 명령 실행

```
flutter pub get
```

* Android Studio에서는 우측 상단 ‘Pub get’ 버튼을 눌러도 동일

---

## 7.4 패키지 임포트(import)와 사용

* Dart 파일 맨 위에 import 구문 추가

```dart
import 'package:url_launcher/url_launcher.dart';
```

---

## 7.5 실습: url\_launcher로 웹사이트/전화/이메일 열기

### 1) url\_launcher 패키지 설치

* pubspec.yaml에 추가(위 예제 참고)
* `flutter pub get` 실행

### 2) 실제 코드 작성

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(UrlLauncherApp());

class UrlLauncherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LauncherHome(),
    );
  }
}

class LauncherHome extends StatelessWidget {
  // 웹사이트 열기
  void _launchWeb() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '웹사이트를 열 수 없습니다: $url';
    }
  }

  // 전화 걸기
  void _callPhone() async {
    final Uri url = Uri.parse('tel:01012345678');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '전화 앱을 열 수 없습니다.';
    }
  }

  // 이메일 작성
  void _sendEmail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'someone@example.com',
      query: 'subject=문의&body=안녕하세요!',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '이메일 앱을 열 수 없습니다.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('url_launcher 실습')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _launchWeb,
              child: Text('Flutter 공식사이트 열기'),
            ),
            ElevatedButton(
              onPressed: _callPhone,
              child: Text('전화 걸기'),
            ),
            ElevatedButton(
              onPressed: _sendEmail,
              child: Text('이메일 작성'),
            ),
          ],
        ),
      ),
    );
  }
}
```

* 각 버튼을 누르면 웹 브라우저, 전화 앱, 이메일 앱이 실행됩니다.
* 에뮬레이터/실기기에서 앱 권한(특히 전화, 이메일) 확인 필요

---

## 7.6 실습: 패키지로 날짜/시간 포맷하기

### 1) intl 패키지 설치

pubspec.yaml에 추가

```yaml
dependencies:
  intl: ^0.18.1
```

### 2) 예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(DateFormatApp());

class DateFormatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatted = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('intl 날짜 포맷')),
        body: Center(
          child: Text('현재 시간: $formatted', style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
```

---

## 7.7 패키지 사용 팁

* **최신 버전**을 사용하는 것이 버그와 보안에 안전
* `flutter pub outdated`로 오래된 패키지 확인 가능
* 필요 없는 패키지는 pubspec.yaml에서 삭제

---

## 7.8 자주 쓰는 추천 패키지

| 패키지명                   | 주요 용도       |
| ---------------------- | ----------- |
| provider               | 상태 관리       |
| shared\_preferences    | 간단한 데이터 저장  |
| http                   | REST API 통신 |
| dio                    | 고급 HTTP 통신  |
| intl                   | 날짜/시간/숫자 포맷 |
| url\_launcher          | 앱 외부 링크 실행  |
| image\_picker          | 갤러리/카메라 사진  |
| flutter\_svg           | SVG 이미지 렌더링 |
| cached\_network\_image | 이미지 캐싱      |

* pub.dev에서 최신 패키지를 검색해보고,
  패키지 예제와 문서를 꼭 확인하세요.

---

### provider – 상태 관리

설명:
- Flutter에서 가장 널리 쓰이는 기본 상태 관리 라이브러리입니다.
- 전역/공유 상태를 쉽고 간단하게 관리할 수 있습니다.
- 예를 들어 카운터 값, 로그인 정보, 테마 설정 등 앱 전체에 영향을 주는 데이터를 관리할 때 사용합니다.

pubspec.yaml  
```yaml
dependencies:
  provider: ^6.0.5
````

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class Counter extends ChangeNotifier {
  int count = 0;
  void increase() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Provider 예제')),
        body: Center(
          child: Consumer<Counter>(
            builder: (context, counter, child) => Text(
              '${counter.count}',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Counter>().increase(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```
주요 사용법
- ChangeNotifierProvider: 상태를 위젯 트리 전체에 공급
- Consumer: 상태가 변경될 때마다 UI를 자동 갱신
- notifyListeners(): 데이터 변경 후 모든 구독자에게 알림
  
---

### shared\_preferences – 간단한 데이터 저장

설명:
- 키-값 형태로 간단한 데이터를 영구적으로 저장하는 플러그인입니다.
- 로그인 정보, 앱 설정, 토글 값 등 작고 단순한 데이터를 로컬에 저장할 때 사용합니다.

pubspec.yaml

```yaml
dependencies:
  shared_preferences: ^2.2.2
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(PrefsDemo());

class PrefsDemo extends StatefulWidget {
  @override
  State<PrefsDemo> createState() => _PrefsDemoState();
}

class _PrefsDemoState extends State<PrefsDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _increment() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('shared_preferences 예제')),
        body: Center(child: Text('$_counter', style: TextStyle(fontSize: 40))),
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```
주요 사용법
- SharedPreferences.getInstance(): 인스턴스 얻기
- setInt, getInt: 정수 저장/불러오기
- 앱 재실행 시에도 값이 유지됩니다.

---

### http – REST API 통신
설명:
- HTTP 프로토콜로 외부 서버와 통신하는 가장 기본적인 패키지입니다.
- GET, POST, PUT, DELETE 등 다양한 API 호출에 사용합니다.

pubspec.yaml

```yaml
dependencies:
  http: ^1.2.1
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(HttpDemo());

class HttpDemo extends StatefulWidget {
  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  String result = '로딩중...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      setState(() => result = data.toString());
    } else {
      setState(() => result = '에러: ${res.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('http 패키지 예제')),
        body: Center(child: Text(result)),
      ),
    );
  }
}
```
주요 사용법
- http.get, http.post 등으로 서버 통신
- 비동기 처리, 응답은 JSON 디코딩

---

### dio – 고급 HTTP 통신
설명:
- 더 강력한 기능(인터셉터, 파일 업/다운로드, 자동 리트라이 등)을 제공하는 고급 HTTP 통신 라이브러리입니다.
- 프로젝트가 커지거나 API 통신이 복잡해질 때 http 대신 dio를 자주 씁니다.

pubspec.yaml

```yaml
dependencies:
  dio: ^5.4.1
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(DioDemo());

class DioDemo extends StatefulWidget {
  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  String result = '로딩중...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final dio = Dio();
    try {
      final res = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
      setState(() => result = res.data.toString());
    } catch (e) {
      setState(() => result = '에러: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('dio 패키지 예제')),
        body: Center(child: Text(result)),
      ),
    );
  }
}
```
주요 사용법
- Dio().get(), Dio().post() 등 고급 HTTP 지원
- 에러/타임아웃/인터셉터 기능
- 파일 업로드, FormData, 헤더 등 유용한 기능 다수

---

### intl – 날짜/시간/숫자 포맷
설명:
- 날짜와 숫자를 로케일(지역)별로 다양한 형식으로 변환할 수 있는 국제화(i18n) 패키지입니다.
- 날짜 표기, 통화/숫자 표기, 문자열 다국어 포맷에 사용됩니다.

pubspec.yaml

```yaml
dependencies:
  intl: ^0.18.1
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // 추가

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null); // 로케일 데이터 초기화
  runApp(IntlDemo());
}

class IntlDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatted = DateFormat('yyyy-MM-dd E HH:mm:ss', 'ko_KR').format(now);
    final number = NumberFormat('#,###').format(1234567);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('intl 패키지 예제')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('날짜: $formatted', style: TextStyle(fontSize: 18)),
              SizedBox(height: 16),
              Text('숫자 포맷: $number', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
```
주요 사용법
- DateFormat, NumberFormat 등
- 지역(locale)별 날짜/숫자 포맷
- 통화, 소수점 자리수, 요일/월 등 자동 표시

---

### url\_launcher – 앱 외부 링크 실행
설명:
- 웹 브라우저에서 링크 열기, 전화 걸기, 이메일 앱 열기 등 앱에서 외부 앱/기능 호출에 사용하는 패키지입니다.
  
pubspec.yaml

```yaml
dependencies:
  url_launcher: ^6.2.6
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(UrlLauncherDemo());

class UrlLauncherDemo extends StatelessWidget {
  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('url_launcher 예제')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _launchUrl('https://flutter.dev'),
                child: Text('웹사이트 열기'),
              ),
              ElevatedButton(
                onPressed: () => _launchUrl('tel:01012345678'),
                child: Text('전화 걸기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
주요 사용법
- launchUrl()로 웹, 전화, 문자, 메일 등 다양한 외부 기능 실행
- 실제 디바이스, 웹, 데스크탑 모두 지원 (단, 일부 권한/설정 필요)
  
---
### image\_picker – 갤러리/카메라 사진

설명:
- 사용자가 사진을 직접 촬영하거나, 갤러리에서 이미지를 선택할 수 있게 하는 플러그인입니다.
- Web 환경에서도 동작 가능(단, 사진 촬영은 모바일만 지원).

pubspec.yaml

```yaml
dependencies:
  image_picker: ^1.0.7
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

void main() => runApp(const ImagePickerDemo());

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      // File 대신 바이트 배열로 이미지를 읽음 (Web & 모바일 모두 지원)
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('image_picker 예제')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageBytes != null
                  ? Image.memory(_imageBytes!, width: 200, height: 200, fit: BoxFit.cover)
                  : const Text('이미지가 없습니다'),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _pickImage, child: const Text('갤러리에서 사진 선택')),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### flutter\_svg – SVG 이미지 렌더링

설명:
- SVG(벡터 그래픽)를 Flutter에서 보여주기 위한 라이브러리입니다. 일반 이미지처럼 확대해도 깨지지 않으며, 아이콘이나 로고 등을 선명하게 표현할 때 유용합니다.

pubspec.yaml

```yaml
dependencies:
  flutter_svg: ^2.0.10+1
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const SvgDemo());

class SvgDemo extends StatelessWidget {
  // 정상적으로 로딩 가능한 SVG 이미지 URL로 교체!
  final String svgUrl =
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/SVG_Logo.svg';

  const SvgDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_svg 예제')),
        body: Center(
          child: SvgPicture.network(
            svgUrl,
            width: 150,
            height: 150,
            placeholderBuilder: (context) => const SizedBox(
              width: 48,
              height: 48,
              child: Center(child: CircularProgressIndicator()),
            ),
            // 에러 처리 (최신 flutter_svg에서 지원)
            semanticsLabel: 'SVG Example',
          ),
        ),
      ),
    );
  }
}
```
주의사항
- Web에서는 CORS 정책 때문에 외부 SVG가 차단될 수 있으므로, 가능하면 assets로 포함하거나 CORS 허용된 경로를 사용하세요.
- 로컬 SVG를 사용하려면 pubspec.yaml에 assets/ 경로를 등록해야 합니다.
  
---

### cached\_network\_image – 이미지 캐싱
설명:
- 인터넷에서 받아온 이미지를 캐싱하여 다음에 빠르게 불러올 수 있도록 해주는 패키지입니다.
- 특히 이미지가 많은 앱(예: 쇼핑몰, 뉴스)에서 이미지 로딩 속도 개선에 효과적입니다.

pubspec.yaml

```yaml
dependencies:
  cached_network_image: ^3.3.1
```

예제 코드

```dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(CachedImageDemo());

class CachedImageDemo extends StatelessWidget {
  final String imageUrl = 'https://picsum.photos/id/237/300/200';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('cached_network_image 예제')),
        body: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) =>
                CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, size: 48),
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
```
주요 사용법
- CachedNetworkImage: 이미지를 다운로드하고 자동으로 캐싱
- placeholder: 로딩 중 UI
- errorWidget: 로딩 실패 시 표시할 위젯
- 이미지가 많을수록 캐싱 효과가 큼
  
---

## 7.9 실전 미션

1. `shared_preferences` 패키지로
   “앱을 껐다 켜도 남아있는 카운터 값”을 구현해보세요.
2. `image_picker` 패키지로
   “사진을 선택하고 화면에 보여주는 앱”을 만들어보세요.

---

### 1) shared_preferences
- “앱을 껐다 켜도 남아있는 카운터 값” 구현

- **핵심:** 카운터 값을 저장하고, 앱 실행 시 다시 불러옴

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatefulWidget {
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  // 카운터 값을 불러옴
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  // 카운터 값을 저장
  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('저장되는 카운터')),
        body: Center(
          child: Text('$_counter', style: TextStyle(fontSize: 40)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
````

* **설명**

  * 앱을 껐다 켜도 마지막 카운트 값이 그대로 유지됩니다.
  * `prefs.setInt()`로 저장, `prefs.getInt()`로 불러옴

---

### 2) image\_picker
* “사진을 선택하고 화면에 보여주는 앱” 구현

* **핵심:** 갤러리에서 이미지를 선택하고 화면에 즉시 출력

```dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data'; // File 대신

void main() => runApp(PhotoApp());

class PhotoApp extends StatefulWidget {
  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      // Web에서는 File 대신 바이트 배열로 읽음!
      final bytes = await picked.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('사진 선택 & 미리보기')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageBytes != null
                  ? Image.memory(_imageBytes!, width: 200, height: 200, fit: BoxFit.cover)
                  : Text('사진이 없습니다'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('갤러리에서 사진 선택'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

* **설명**

  * 버튼을 누르면 갤러리가 열리고, 선택한 사진이 앱에 바로 표시됩니다.
  * iOS/Android 권한 설정 필요(실제 기기에서 테스트 권장)

---

## 7.10 패키지 관련 FAQ

* Q: pubspec.yaml에서 패키지 버전 오류가 나요!

  * → 최신 버전 명시, 또는 `any`로 테스트
* Q: 패키지 설치 후 인식이 안됩니다.

  * → `flutter pub get`을 실행, 또는 IDE 재시작
* Q: 예제 코드가 안 돌면?

  * → 해당 패키지의 pub.dev 문서에서 예제, 호환 버전을 확인

---

## 7장 마무리

이 장에서는 pub.dev에서 외부 패키지를 설치하고,
실제 앱에서 활용하는 방법을 배웠습니다.

다음 장에서는 Firebase 같은 클라우드 서비스와 연동하는 방법을 다룹니다.
