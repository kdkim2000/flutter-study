# 1장: Flutter 소개 및 개발환경 구축

---

## 1.1 Flutter란 무엇인가?

Flutter는 Google에서 개발한 오픈소스 UI 프레임워크입니다.  
한 번의 코드 작성으로 Android, iOS, Web, Windows, macOS, Linux 앱까지 모두 개발할 수 있는 ‘크로스 플랫폼’ 개발 도구입니다.

- **Dart** 언어 기반 (Java/C#/JavaScript 개발자라면 바로 적응 가능)
- 풍부하고 반응성 높은 UI
- 네이티브 성능
- Hot Reload 지원(코드 변경 후 즉시 결과 확인)

> **왜 Flutter인가?**
> - 유지보수와 생산성이 압도적입니다.  
> - 앱의 일관된 디자인과 성능을 보장합니다.  
> - 대기업/스타트업 모두 폭넓게 사용 중입니다.

---

## 1.2 Flutter 개발환경 준비 (Windows 11 기준)

### 1.2.1 Flutter SDK 설치

1. [Flutter 공식 다운로드 페이지](https://docs.flutter.dev/get-started/install/windows) 접속  
2. ‘Windows’ 탭에서 최신 ZIP 파일 다운로드  
3. 예를 들어, `C:\src\flutter` 경로에 압축 해제 (**한글/공백 없는 경로** 강력 추천!)
4. 환경 변수 추가  
   - **제어판 → 시스템 → 고급 시스템 설정 → 환경 변수 → Path에 `C:\src\flutter\bin` 추가**
5. **CMD(명령 프롬프트)에서 정상 인식되는지 확인**
    ```sh
    flutter --version
    ```

---

### 1.2.2 Android Studio 설치 및 설정

1. [Android Studio 다운로드](https://developer.android.com/studio)
2. 설치 진행 (권장: 기본 옵션 사용)
3. **첫 실행 시, ‘More Actions > SDK Manager’ 진입**

   * Android SDK, Command-line tools, Emulator 등 모두 설치
   * **API Level 34(최신) 포함**
4. **플러그인 설치**

   * 메뉴 → Plugins → ‘Flutter’ 검색 및 설치
   * 설치 과정 중 ‘Dart’ 플러그인도 같이 설치

---

### 1.2.3 VS Code (옵션)

* 경량 IDE로 빠른 테스트/코딩에 유리
* [VS Code 다운로드](https://code.visualstudio.com/)
* Extensions에서 Flutter/Dart 설치

---

### 1.2.4 필수 환경 체크: flutter doctor

* **터미널(명령 프롬프트)** 에서 아래 명령 실행:

  ```sh
  flutter doctor
  ```
* 설치/설정 상태를 한 눈에 점검

예시 결과:

```
[✓] Flutter (Channel stable, 3.22.1, on Microsoft Windows ...)
[✓] Android toolchain - develop for Android devices
[✓] Chrome - develop for the web
[✓] Visual Studio - develop Windows apps
[✓] Android Studio (version 2023.x)
[✓] VS Code (version 1.80.0)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

#### **문제가 발생하는 경우**

* **Android licenses not accepted?**

  ```sh
  flutter doctor --android-licenses
  ```

  y 키로 모두 동의

* **Android SDK not found?**

  * Android Studio > SDK Manager에서 Command-line tools, Android SDK 설치 확인
  * 환경변수(ANDROID\_HOME) 필요시 수동 지정

---

## 1.3 첫 Flutter 프로젝트 만들기

### 1.3.1 Android Studio에서 새 프로젝트 생성

1. Android Studio 실행 → **New Flutter Project** 클릭
2. Flutter SDK 경로 입력 (예: `C:\src\flutter`)
3. Project Name: `my_first_flutter`
4. Project location: (본인 개발 폴더)
5. Organization: `com.yourcompany`
6. Description: 원하는 설명 입력
7. Platforms: Android, iOS(옵션), Web(옵션) 등 체크
8. ‘Finish’ 클릭

> **Tip:**
> 모든 경로에 한글/공백이 없어야 합니다!

---

### 1.3.2 프로젝트 폴더 구조 이해

* `/lib` – Dart 소스코드

  * `main.dart` : 앱 진입점(메인 함수)
* `/android`, `/ios`, `/web`, `/windows` – 플랫폼별 네이티브 프로젝트
* `/test` – 테스트 코드

---

### 1.3.3 첫 코드 실행 (Hello Flutter!)

1. **에뮬레이터(또는 실제 디바이스) 실행**

   * Android Studio > Device Manager > 가상 장치 생성 및 실행
2. main.dart 예시 코드를 입력하고 실행

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
      title: 'Hello Flutter',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter 첫 앱')),
        body: Center(child: Text('Hello Flutter!')),
      ),
    );
  }
}
```

> **실행 결과:**
> 파란 AppBar와 "Hello Flutter!" 텍스트가 가운데에 표시됩니다.

---

## 1.4 자주 묻는 질문(FAQ) & 문제 해결

### Q1. "Unable to locate Android SDK" 에러가 나와요!

* Android Studio > SDK Manager에서 최신 SDK, Command-line tools 모두 설치
* 환경 변수 `ANDROID_SDK_ROOT`를 Android SDK 경로로 지정 (예: `C:\Users\<사용자>\AppData\Local\Android\Sdk`)

### Q2. 프로젝트 생성은 되는데 에뮬레이터가 실행되지 않습니다.

* PC의 가상화(VT) 옵션(BIOS에서)을 활성화
* Hyper-V가 켜져있으면 Genymotion 등 일부 에뮬레이터와 충돌 가능

### Q3. Flutter 명령어가 인식이 안돼요!

* 환경 변수 Path에 Flutter 경로가 제대로 추가되어 있는지 확인

### Q4. 프로젝트가 깨끗하게 생성되지 않는다면?

* `flutter clean` 명령 실행
* Android Studio 재시작

---

## 1.5 실습: 내 정보 출력해보기

1. 아래와 같이 `main.dart`를 수정해 본다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyInfoApp());
}

class MyInfoApp extends StatelessWidget {
  const MyInfoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('내 정보')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('이름: 홍길동', style: TextStyle(fontSize: 24)),
              SizedBox(height: 12),
              Text('Flutter 공부 시작!', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
```

> **실습 미션:**
>
> * 위 예제를 실행한 후, `이름`과 `문구`를 여러분의 것으로 바꿔 실행해 보세요!

---

## 1.6 추천 참고자료 & 공식 문서

* [Flutter 공식 문서 (한국어)](https://docs.flutter.dev/?hl=ko)
* [Flutter 패키지 검색 pub.dev](https://pub.dev/)
* [Dart 공식 문서](https://dart.dev/guides)
* [구글 개발자 공식 유튜브 - Flutter](https://www.youtube.com/c/flutterdev)

---

## 1장 마무리

이제 여러분의 PC에 Flutter 개발환경이 모두 갖춰졌습니다!
다음 장에서는 **Dart 언어의 기초 문법**과 Flutter 앱의 구조를 배웁니다.

---


**필요하면 위 마크다운을 복사해서 파일로 바로 저장해도 좋습니다.**  
다음 파일(예: `chapter2.md`, 혹은 src/ 코드를 원하시면 파일명을 말씀해 주세요!)  
항상 **실제 개발자 시점에서** 상세하고 초보자 친화적으로 작성해서 드리겠습니다.
