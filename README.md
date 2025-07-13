# Flutter 입문 교재 (Java & JavaScript 개발자를 위한)

본 문서는 Java와 JavaScript 개발 경험이 있는 분들을 대상으로 **Flutter**를 처음부터 학습하여 하나의 앱을 완성할 수 있도록 도와주는 입문 교재입니다. Android Studio를 기반으로 Flutter 개발환경 구축에서 시작하여, Dart 기초 문법, Flutter 위젯과 레이아웃, 상태 관리, 화면 라우팅, 외부 패키지 활용, Firebase 연동까지 **전 과정을 단계별로 자세히** 안내합니다. 각 장에는 따라하기 쉬운 예제 코드와 실행 결과 스크린샷, 그리고 실습 중 자주 만나는 문제와 디버깅 팁을 포함합니다. 이 자료는 GitHub 저장소의 README 형태로 작성되어 있으므로, 마크다운 형식의 챕터 구조와 목차를 포함하고 있습니다.

## 목차
- [1장: Flutter 소개 및 개발환경 구축](#1장-flutter-소개-및-개발환경-구축)
- [2장: Dart 언어 기초 훑어보기](#2장-dart-언어-기초-훑어보기)
- [3장: Flutter 기본 구조와 위젯](#3장-flutter-기본-구조와-위젯)
- [4장: 레이아웃과 화면 구성 방법](#4장-레이아웃과-화면-구성-방법)
- [5장: 상태 관리 (State Management)](#5장-상태-관리-state-management)
- [6장: 화면 전환과 라우팅](#6장-화면-전환과-라우팅)
- [7장: 외부 패키지 활용하기](#7장-외부-패키지-활용하기)
- [8장: Firebase 연동](#8장-firebase-연동)
- [9장: 실전 프로젝트 – 할 일 목록 앱 만들기](#9장-실전-프로젝트--할-일-목록-앱-만들기)
- [부록: Flutter 개발 팁과 자주 겪는 이슈](#부록-flutter-개발-팁과-자주-겪는-이슈)

---

좋습니다. Java와 JavaScript 경험이 있는 부서원을 대상으로, Android Studio 기반으로 Flutter 설치부터 Dart 기초, 위젯, 상태관리, 앱 개발 완성까지 다루는 상세한 마크다운 형식의 교재를 준비하겠습니다. 실습 중심 예제를 통해 자연스럽게 익힐 수 있도록 구성하겠습니다.

완성 후 GitHub에 올릴 수 있는 형태로 제공드릴게요. 작업이 완료되면 알려드리겠습니다.


# Flutter 입문 교재 (Java & JavaScript 개발자를 위한)

본 문서는 Java와 JavaScript 개발 경험이 있는 분들을 대상으로 **Flutter**를 처음부터 학습하여 하나의 앱을 완성할 수 있도록 도와주는 입문 교재입니다. Android Studio를 기반으로 Flutter 개발환경 구축에서 시작하여, Dart 기초 문법, Flutter 위젯과 레이아웃, 상태 관리, 화면 라우팅, 외부 패키지 활용, Firebase 연동까지 **전 과정을 단계별로 자세히** 안내합니다. 각 장에는 따라하기 쉬운 예제 코드와 실행 결과 스크린샷, 그리고 실습 중 자주 만나는 문제와 디버깅 팁을 포함합니다. 이 자료는 GitHub 저장소의 README 형태로 작성되어 있으므로, 마크다운 형식의 챕터 구조와 목차를 포함하고 있습니다.

## 목차

* [1장: Flutter 소개 및 개발환경 구축](#1장-flutter-소개-및-개발환경-구축)
* [2장: Dart 언어 기초 훑어보기](#2장-dart-언어-기초-훑어보기)
* [3장: Flutter 기본 구조와 위젯](#3장-flutter-기본-구조와-위젯)
* [4장: 레이아웃과 화면 구성 방법](#4장-레이아웃과-화면-구성-방법)
* [5장: 상태 관리 (State Management)](#5장-상태-관리-state-management)
* [6장: 화면 전환과 라우팅](#6장-화면-전환과-라우팅)
* [7장: 외부 패키지 활용하기](#7장-외부-패키지-활용하기)
* [8장: Firebase 연동](#8장-firebase-연동)
* [9장: 실전 프로젝트 – 할 일 목록 앱 만들기](#9장-실전-프로젝트--할-일-목록-앱-만들기)
* [부록: Flutter 개발 팁과 자주 겪는 이슈](#부록-flutter-개발-팁과-자주-겪는-이슈)

---

## 1장: Flutter 소개 및 개발환경 구축

### Flutter란 무엇인가?

**Flutter**는 Google에서 개발한 UI 프레임워크로, 하나의 코드베이스로 모바일(Android/iOS), 웹, 데스크톱 등 다양한 플랫폼의 애플리케이션을 만들 수 있습니다. Flutter는 **Dart**라는 언어로 개발되며, \*\*“모든 것이 위젯으로 구성”\*\*된 구조를 갖습니다. 이는 React나 Angular처럼 UI를 구성요소(위젯)들의 트리로 선언적으로 구성하는 방식을 떠올리면 이해하기 쉽습니다. Flutter는 내부적으로 Skia 2D 렌더링 엔진을 사용하여 높은 퍼포먼스를 발휘하며, 네이티브 플랫폼 위에 **자체 렌더링 엔진**을 통해 일관된 UI 표현을 합니다. Android 개발자에게는 **뷰(View)** 대신 **위젯(Widget)** 개념으로 UI를 구성한다는 점, 그리고 레이아웃 개념이 Android의 LinearLayout, ConstraintLayout 등과 유사한 면이 있음을 느낄 수 있습니다. JavaScript 개발자(특히 React 경험자)에게는, Flutter의 선언적 UI와 상태관리 개념이 React의 컴포넌트와 상태 관리와 비슷하게 느껴질 수 있습니다.

**왜 Dart 언어인가?** Dart은 Java와 문법적으로 유사하며 객체지향 언어로서 **정적 타입**을 가지지만 `var` 키워드로 타입 추론을 지원하고, JavaScript처럼 **JIT 컴파일**(개발 중 핫 리로드에 유리)과 **AOT 컴파일**(릴리스 시 최적화된 네이티브 코드 생성)을 모두 활용합니다. Java나 Kotlin에 익숙한 Android 개발자도, JavaScript나 TypeScript에 익숙한 웹 개발자도 비교적 쉽게 Dart 문법을 이해할 수 있습니다.

### 개발환경 준비

Flutter로 개발하려면 PC에 몇 가지 도구를 설치하고 설정해야 합니다. **Windows**와 **macOS** 모두 Flutter 개발이 가능하며, 여기서는 주로 Android Studio를 이용하는 방법을 다룹니다.

**1. Flutter SDK 설치:** Flutter 공식 사이트에서 OS에 맞는 Flutter SDK를 다운로드 받아 압축을 풉니다. 예를 들어 Windows 사용자는 최신 버전 Flutter SDK ZIP 파일을 받아 `C:\flutter`처럼 경로에 **한글이나 공백이 없는** 디렉토리에 압축을 풉니다. (한글 경로나 공백이 있으면 나중에 일부 도구가 오류를 일으킬 수 있으니 유의하세요.) Mac 사용자는 다운로드한 SDK 압축을 적당한 경로 (예: 사용자 홈 디렉토리 내)로 풀면 됩니다.

**2. 개발 도구 설치:** **Android Studio** 최신 버전을 설치합니다. Android Studio에는 Android SDK와 빌드 도구, JDK 등이 포함되어 있어 Flutter 모바일 앱 개발에 필요한 환경을 비교적 쉽게 준비할 수 있습니다. (만약 Mac의 Apple Silicon 칩을 사용 중이라면 Android Studio 다운로드 시 ARM 버전을 선택하세요.) Android Studio 설치 중에는 **Standard** 설정으로 진행하고, Android SDK 등 필요한 구성 요소도 함께 설치합니다. 설치 완료 후 Android Studio 첫 실행 시 초기 설정 마법사가 나오는데, 권장 설정을 적용하면 됩니다.

**3. Android Studio에서 Flutter 플러그인 설정:** Android Studio를 실행한 후, **Plugins** 메뉴로 이동하여 **Flutter** 플러그인을 검색해 설치합니다. Flutter 플러그인을 설치하면 필요한 Dart 플러그인도 함께 설치되므로, Flutter와 Dart 모두 인식되게 됩니다. 플러그인 설치 후 Android Studio를 재시작하면 Flutter 프로젝트를 생성할 수 있는 옵션이 활성화됩니다.

**4. Flutter PATH 환경변수 설정:** (Windows의 경우) Flutter SDK의 `bin` 폴더 경로를 시스템 **PATH 환경변수**에 추가해야 커맨드라인에서 `flutter` 명령을 사용할 수 있습니다. Windows에서는 "시스템 환경 변수 편집"을 검색하여 환경 변수 편집 창을 열고, 시스템 변수 중 `Path`에 `C:\flutter\bin` (설치한 경로에 맞게) 경로를 새로 추가합니다. Mac의 경우 터미널 쉘 설정 파일(`~/.bash_profile` 혹은 `~/.zshrc`)에 `export PATH="$PATH:[설치경로]/flutter/bin"` 한 줄을 추가하여 저장하면 됩니다. 그런 다음 새로운 터미널을 열어 `flutter doctor` 명령이 인식되는지 확인합니다.

**5. Flutter Doctor로 환경 진단:** 터미널(또는 명령 프롬프트/Powershell)을 열어 `flutter doctor`를 실행하면 Flutter 개발에 필요한 구성 요소들이 잘 설치되었는지 체크해줍니다. 이 명령을 실행하면 Android SDK, iOS 설정(Mac인 경우), Flutter SDK, IDE 플러그인 설치 여부 등을 검사하여 보고서를 출력합니다. 아래는 예시입니다 (환경에 따라 다르게 나올 수 있습니다):

```bash
$ flutter doctor
[✓] Flutter (Channel stable, 3.x.x, on Microsoft Windows [Version 10.0.19045.3086], locale ko-KR)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2022.xx)
[✓] VS Code (version 1.xx.x)
[✓] Connected device (1 available)  // 에뮬레이터나 연결된 기기 확인
```

만약 `[X]`로 표시되는 항목이 있다면 해당 항목 옆에 에러 메시지나 해결 방법이 함께 표시됩니다. 예를 들어 `Android license status unknown` 에러가 보인다면 터미널에 `flutter doctor --android-licenses` 명령을 입력하여 모든 라이선스에 동의하면 해결됩니다. `cmdline-tools component is missing` 에러는 Android Studio의 SDK Manager에서 **Android SDK Command-line Tools**가 설치되어 있지 않을 때 발생하며, 해당 구성 요소를 설치하면 됩니다. 또한 `Chrome` 관련 에러가 있다면 Chrome 브라우저를 설치해주면 해결됩니다. 이러한 과정을 통해 `flutter doctor` 출력 상의 모든 체크표시(`[✓]`)를 완료하는 것을 목표로 합니다.

> 💡 **Troubleshooting:**
>
> * `flutter` 명령을 인식하지 못한다면 PATH 설정이 제대로 되었는지 확인하세요. (Windows에서는 명령 프롬프트를 재실행해야 반영됩니다.)
> * Android Studio를 설치했는데 `flutter doctor`에서 Android Studio를 못 찾는다면, Android Studio를 한 번 실행하여 초기 설정을 완료했는지 확인하세요.
> * `flutter doctor --android-licenses` 실행 시 SDK 경로 관련 오류가 나면, Android SDK가 설치되었는지 또는 ANDROID\_SDK\_ROOT 환경변수가 설정되었는지 점검하세요.

**6. 가상 디바이스 또는 실기기 준비:** Android 에뮬레이터를 사용하려면 Android Studio의 **AVD Manager**를 통해 가상 디바이스를 생성하세요. 또는 USB로 실제 Android 기기를 연결해 개발 모드로 사용하는 것도 가능합니다. Mac 사용자의 경우 iOS 시뮬레이터를 쓰려면 Xcode를 설치하고 `flutter doctor`에서 권고하는 추가 설정(예: CocoaPods 설치)을 해주어야 합니다. 하지만 이 교재에서는 주로 Android 환경을 중심으로 설명합니다.

**7. Flutter 새 프로젝트 생성:** 환경 구성이 끝났다면, Android Studio에서 새 Flutter 프로젝트를 만들어보겠습니다. Android Studio 홈 화면 또는 **File > New > New Flutter Project** 메뉴를 통해 Flutter 프로젝트 생성을 시작합니다. 프로젝트 유형으로 **Flutter Application**을 선택하고 SDK 경로가 올바르게 설정되어 있는지 확인합니다. 그리고 프로젝트명, 저장 경로, 조직명(보통 `com.example` 형태) 등을 지정합니다. 마지막으로 **Finish**를 클릭하면 기본 Flutter 앱 템플릿이 생성됩니다. 이 템플릿에는 기본적으로 `lib/main.dart` 파일에 간단한 카운터 앱 예제가 포함되어 있습니다.

**8. 앱 실행 테스트:** 생성한 Flutter 프로젝트를 실행하여 정상적으로 동작하는지 확인해봅니다. Android Studio 상단의 실행 대상(Device)을 설정하는 드롭다운에서 가상 장치나 연결된 실제 기기를 선택한 뒤, 초록색 \*\*재생 버튼(▶)\*\*을 눌러 앱을 빌드 및 실행합니다. 만약 개발 PC에 모바일 에뮬레이터 환경이 준비되지 않았다면, \*\*Chrome(Web)\*\*을 타깃으로 선택하고 실행하여 웹 브라우저에서 앱을 테스트할 수도 있습니다. 아래는 기본 템플릿 앱("Flutter Demo")이 실행된 화면 예시입니다:

&#x20;*기본 Flutter 프로젝트 템플릿 앱 실행 화면 (숫자 카운터 데모 앱)*

첫 실행 시 빌드에는 다소 시간이 걸릴 수 있지만, \*\*"Flutter Demo Home Page"\*\*라는 제목의 화면과 중앙의 텍스트(`You have pushed the button this many times.`) 및 우측 하단의 **+ 버튼**(FloatingActionButton)이 보이면 성공입니다. 버튼을 누를 때마다 숫자가 증가하는 이 간단한 앱을 통해 Flutter 개발 사이클을 맛볼 수 있습니다.

> 🔍 **용어 설명:**
> Flutter에서는 UI 구성 요소를 \*\*위젯(Widget)\*\*이라 부릅니다. Material 디자인을 사용하는 기본 앱 템플릿에서는 `MaterialApp`, `Scaffold`, `AppBar`, `Center`, `Text`, `FloatingActionButton` 등 여러 **위젯**이 계층적으로 구성되어 UI를 이룹니다. 곧 이어지는 장에서 이 구조를 상세히 살펴보겠습니다.

---

## 2장: Dart 언어 기초 훑어보기

Flutter 앱 개발에 사용하는 언어는 **Dart**입니다. Dart는 Java/C#와 유사한 객체지향 언어이지만 문법적으로 간결하고 **함수형 프로그래밍** 스타일을 일부 차용하고 있으며, JavaScript처럼 **async/await** 기반의 비동기 처리도 지원합니다. 이 장에서는 Dart의 핵심 문법을 간략히 짚고 넘어가겠습니다. Java나 JavaScript에 익숙한 독자라면 Dart의 개념을 쉽게 이해할 수 있을 것입니다. 여기서는 이론보다는 **코드 예제**를 통해 실습하며 Dart 문법에 익숙해지도록 하겠습니다.

### Dart 기본 구조와 문법 요소

* **엔트리 포인트 (main 함수):** C, Java, JavaScript(Node) 등과 마찬가지로 Dart 프로그램은 `main()` 함수에서 시작합니다. Flutter 앱의 `main.dart` 파일에도 `void main() { runApp(MyApp()); }` 형태의 `main()` 함수가 존재합니다.

  ```dart
  void main() {
    print('Hello Dart!');
  }
  ```

  위 코드를 Dart로 실행하면 콘솔에 `Hello Dart!`를 출력합니다. Flutter에서는 `runApp()` 함수를 호출하여 Flutter 위젯 트리를 화면에 띄우는 역할을 합니다.

* **변수와 타입:** Dart은 정적 타입 언어이지만 **타입 추론**이 가능합니다. 변수를 선언할 때 `var` 키워드를 사용하면 초기값을 보고 타입이 결정됩니다. 물론 원하는 경우 타입을 명시할 수도 있습니다. 기본 타입으로 `int`, `double`, `String`, `bool` 등이 있으며, 컬렉션 타입으로 `List`와 `Map` 등이 있습니다.

  ```dart
  var name = "홍길동";        // String으로 추론
  var age = 27;             // int로 추론
  String city = "Seoul";    // 타입 명시적 선언도 가능
  List<int> numbers = [1, 2, 3];
  Map<String, String> user = { 'id': 'abc123', 'role': 'admin' };
  ```

  위 예시에서 `name`과 `age`는 `var`로 선언되어 각각 String과 int 타입으로 추론됩니다. Dart의 문자열은 Java와 달리 작은따옴표(')와 큰따옴표(") 모두 사용할 수 있고, **문자열 보간**(`Hello $name`) 기능을 지원합니다. 또, Dart에서는 모든 것이 객체라서 숫자도 메서드를 가질 수 있고(`5.toString()` 등), **null-safety**를 지원하여 변수 타입에 기본적으로 null 값이 허용되지 않습니다 (null을 허용하려면 타입에 `?`를 붙여야 함, 예: `String? nullableName;`).

* **흐름제어 문장:** Dart의 제어문은 Java/JavaScript와 거의 동일합니다. `if`/`else`, `for` 루프, `while` 루프 등을 동일한 문법으로 사용할 수 있습니다. 또한 각 반복문에 대해 `break`와 `continue`도 동일하게 동작합니다.

  ```dart
  if (age < 20) {
    print('청소년 할인 대상입니다.');
  } else {
    print('일반 요금입니다.');
  }

  for (int i = 0; i < 5; i++) {
    print('Hello $i');
  }

  while (numbers.isNotEmpty) {
    print(numbers.removeLast());
  }
  ```

  위 코드는 나이에 따라 다른 메시지를 출력하고, for 루프로 0부터 4까지 출력하며, while 루프로 리스트의 요소를 하나씩 제거하며 출력하는 예입니다.

* **함수 선언과 람다:** Dart에서는 함수도 `Type 함수명(매개변수) { ... }` 형태로 선언합니다. 반환 타입을 지정하거나 (지정하지 않으면 `void` 또는 `dynamic`으로 간주) 화살표 문법으로 간단히 표현할 수도 있습니다. 또한 함수를 변수에 할당하거나 인자로 넘길 수 있어 일급 객체로 취급됩니다.

  ```dart
  // 전통적인 함수 선언
  int add(int a, int b) {
    return a + b;
  }

  // 한 줄짜리 함수는 화살표 함수로 표현 가능
  int multiply(int a, int b) => a * b;

  // 함수형 프로그래밍 스타일: 함수를 변수에 할당
  var operations = [add, multiply];
  print( operations[0](2, 3) );  // 2와 3을 더하는 add 함수 호출 결과
  ```

  위에서 `add`와 `multiply`는 각각 두 수를 더하고 곱하는 함수입니다. `multiply`는 반환값만 있는 단순한 함수이기에 화살표 (`=>`)로 축약했으며, 이는 곧바로 표현식을 평가하여 반환합니다. Dart의 함수는 기본적으로 **Named Parameter**와 **Optional Parameter**도 지원하지만 (예: `func(int a, {String? name, int age=0})` 형태), 초급 단계에서는 우선 기본적인 사용법에 익숙해지면 충분합니다.

* **클래스와 객체지향:** Dart은 클래스 기반 객체지향 언어입니다. Java와 달리 상속은 단일 상속만 지원하지만 `with` 키워드를 통한 믹스인(mixin)으로 다중 상속 비슷하게 활용할 수 있습니다. 기본 문법은 Java와 비슷합니다.

  ```dart
  class Person {
    String name;
    int age;
    
    // 생성자
    Person(this.name, this.age);
    
    // Named constructor (이름 있는 생성자) 예시
    Person.named(String name) : this(name, 0);
    
    void introduce() {
      print("안녕하세요, $name입니다. 나이는 $age살입니다.");
    }
  }

  var p1 = Person("김철수", 30);
  p1.introduce();
  ```

  위 클래스 `Person`은 `name`과 `age` 필드를 가지며, 생성자를 통해 필드를 초기화합니다. `Person.named`처럼 콜론(`:`)을 사용해 초기화 리스트로 다른 생성자를 호출할 수도 있습니다. `_`로 시작하는 멤버명은 \*\*프라이빗(private)\*\*으로 간주되어 라이브러리 밖에서 접근할 수 없습니다. Dart의 클래스는 인터페이스를 별도로 명시하지 않아도 모든 클래스가 암묵적으로 인터페이스 역할을 하며, `implements` 키워드로 인터페이스 구현을 강제할 수 있습니다. 또한, Java의 `extends`와 동일하게 상속을 구현할 수 있습니다 (예: `class Student extends Person { ... }`).

  > 참고: Dart는 **기본적으로 null-safe**입니다. 따라서 생성자에서 non-nullable 필드를 모두 초기화하지 않으면 에러가 발생합니다. 위 예제에서는 생성자에서 `name`과 `age`를 모두 초기화하므로 문제없습니다.

* **컬렉션(List, Set, Map) 다루기:** Dart의 컬렉션은 제네릭으로 타입을 지정할 수 있습니다 (`List<int>`, `Map<String, String>` 등). 자주 사용하는 기능으로 리스트의 `add`, `remove`, 맵의 `putIfAbsent`, `forEach` 반복 등이 있습니다. 또한 Dart collections의 강력한 점은 **컬렉션 if와 컬렉션 for** 문법입니다. Flutter UI 코드를 작성할 때 조건부로 위젯을 리스트에 추가하거나, 리스트의 내용으로 위젯을 생성할 때 유용하게 쓰입니다. 예:

  ```dart
  var fruits = ['apple', 'banana', 'orange'];
  var selected = 'banana';
  var widgetList = [
    Text('과일 목록:'),
    for (var f in fruits) 
      Text(f),
    if (fruits.contains(selected)) 
      Text('선택된 과일: $selected')
  ];
  ```

  위 `widgetList`는 `Text` 위젯 몇 개를 담은 리스트인데, `for` 문을 사용해 `fruits`의 모든 항목에 대한 `Text(f)`를 생성했고, `if` 문으로 특정 조건일 때만 위젯을 추가했습니다. 이러한 문법은 Flutter UI 구성 시 코드 양을 줄이고 가독성을 높여줍니다.

* **비동기 처리 (async/await):** Dart는 `Future`와 `async/await` 키워드를 통해 비동기를 지원합니다. JavaScript의 Promise와 유사한 개념입니다. 예를 들어 HTTP 호출이나 파일 I/O 같은 느린 작업을 수행할 때 `await`를 사용해 Future가 완료될 때까지 기다릴 수 있습니다.

  ```dart
  Future<String> fetchData() async {
    // 예시: 2초 후 문자열 반환
    await Future.delayed(Duration(seconds: 2));
    return "완료!";
  }

  void main() async {
    print("호출 시작");
    String result = await fetchData();
    print("결과: $result");
  }
  ```

  위 코드에서 `fetchData` 함수는 2초 지연 후 `"완료!"` 문자열을 반환하는 Future를 리턴하며, `main` 함수에서 이를 `await`로 받아옵니다. `async` 함수 내에서만 `await`를 사용할 수 있으며, `await`는 Future의 완료를 기다리는 동안 스레드를 블로킹하지 않고 Dart 이벤트 루프에 제어권을 양보합니다. 이 개념은 Flutter 앱에서 네트워크 호출이나 비동기 연산 (예: Firebase 호출 등) 시 매우 중요하므로, 추후 실제 예제에서 다시 다루겠습니다.

**실습 예제:** 간단한 Dart 콘솔 프로그램을 직접 실행해보고 싶다면, Flutter SDK에 포함된 `dart` 커맨드를 사용하거나 DartPad([https://dartpad.dev/](https://dartpad.dev/)) 웹사이트를 이용할 수 있습니다. 예를 들어 아래 코드를 DartPad에 입력해보세요.

```dart
void main() {
  List<String> names = ["철수", "영희", "민수"];
  for (var name in names) {
    print("안녕, $name!");
  }
}
```

DartPad 우측 콘솔에 각 이름에 대해 인사말이 출력될 것입니다. 이런 방식으로 Dart 문법에 대한 감을 익힌 후, Flutter 프로젝트의 실제 코드에 적용해보면 더욱 이해가 빠릅니다.

---

## 3장: Flutter 기본 구조와 위젯

이제 Flutter 앱의 구조와 \*\*위젯(widget)\*\*에 대해 알아보겠습니다. 앞서 생성한 기본 템플릿 앱 코드를 기준으로 Flutter의 주요 요소들을 해부해보겠습니다. **Flutter에서는 화면에 보이는 모든 것이 위젯**이며, 위젯을 **중첩**(nesting)하여 UI 레이아웃을 구성합니다.

### Flutter 프로젝트 구조 개요

Flutter 프로젝트를 생성하면 기본적으로 다음과 같은 구조의 폴더가 만들어집니다:

```
my_app/
├─ android/        - 안드로이드 네이티브 프로젝트 (Flutter 코드를 감싸는 Wrapper)
├─ ios/            - iOS 네이티브 프로젝트
├─ lib/            - Dart 코드 (Flutter 앱의 메인 소스)
│   └─ main.dart   - 앱 진입점 Dart 파일
├─ pubspec.yaml    - 프로젝트 메타정보 및 의존 패키지 관리 파일
└─ ... 그 외 생략 ...
```

대부분의 Flutter 앱 개발은 `lib/` 폴더 내의 Dart 코드 작성에 집중됩니다. `pubspec.yaml` 파일은 앱의 이름, 버전, 에셋, 의존 패키지 등을 선언하는 곳입니다. (7장에서 외부 패키지를 추가할 때 `pubspec.yaml`을 편집할 것입니다.)

기본 템플릿의 `lib/main.dart`을 열어보면 아래와 같은 코드가 있습니다 (일부 주석 제거하여 발췌):

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
      title: 'Flutter Demo',
      theme: ThemeData( …생략… ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
```

이 코드가 의미하는 바를 하나씩 풀어보겠습니다:

* `main()` 함수에서 `runApp(MyApp())`을 호출하는데, 이것이 Flutter 프레임워크에 **MyApp 위젯**을 루트로 지정하여 앱을 시작하라는 명령입니다. `runApp`을 호출하면, 전달된 위젯을 화면에 렌더링하기 시작합니다.
* `MyApp` 클래스는 `StatelessWidget`을 상속받은 **위젯 클래스**입니다. **Stateless widget**은 상태가 변하지 않는 위젯, 즉 내부에 변할 상태(state)가 없고 한 번 그리면 끝인 UI를 표현합니다. `MyApp`의 `build` 메서드는 `MaterialApp` 위젯을 반환하고 있습니다. `MaterialApp`은 Material Design 앱을 구성하는 최상위 위젯으로, 앱의 테마, 라우팅, locale 등 전역 설정을 제공합니다. 여기서는 `title`, `theme`, `home` 프로퍼티가 설정되어 있네요.
* `home: MyHomePage(...)` 부분이 이 앱의 첫 화면으로 표시할 위젯을 가리킵니다. `MyHomePage`는 StatefulWidget으로 정의되어 있는데, 화면에 보이는 카운터 UI를 담당합니다.

StatelessWidget vs StatefulWidget에 대해 잠깐 짚고 넘어갈 필요가 있습니다. **Stateful widget**은 내부에 **State 객체**를 가지고 있으며, 이 State가 변경될 때마다 위젯의 `build` 메서드가 다시 호출되어 UI가 갱신됩니다. 반면 StatelessWidget은 build 결과가 한 번 정해지면 이후 변하지 않으며, 상태를 가질 수 없습니다. Flutter에서는 **대부분의 UI 컴포넌트를 Stateless로 만들고**, 필요할 때만 Stateful로 만들어 일부분을 갱신하는 패턴을 많이 사용합니다.

`MyHomePage`를 계속 살펴보면, 이 클래스는 StatefulWidget이고 `createState()` 메서드에서 `_MyHomePageState`를 생성합니다. `_MyHomePageState` 클래스는 아래와 같이 (템플릿 코드 상) 정의되어 있을 것입니다:

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center( …생략… ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

이 부분은 Flutter 기본 카운터 앱의 핵심 코드입니다:

* `_counter`라는 정수형 상태 변수가 있고 초기값 0으로 정의됩니다.
* `_incrementCounter()` 함수에서는 `setState()`를 호출하여 `_counter`를 증가시키고 있습니다. `setState`는 State 객체의 상태가 변경되었음을 Flutter Framework에 알리는 역할을 하며, 그 결과 Flutter는 해당 위젯 트리를 다시 build(재빌드)하여 화면을 갱신합니다.
* `build` 메서드는 이 화면의 UI를 구성합니다. `Scaffold` 위젯은 화면의 뼈대를 만드는 위젯으로, 앱바(`appBar`), 본문(`body`), 플로팅버튼(`floatingActionButton`) 등의 슬롯을 제공합니다.

  * `AppBar`에는 위젯의 제목이 표시되고 (`widget.title`로 상위 MyHomePage로부터 전달받은 title 사용),
  * `body`에는 `Center` 위젯으로 중앙정렬된 내용이 들어갑니다. 기본 템플릿에서는 `Column`을 이용해 텍스트와 숫자를 세로로 배치하고, `_counter` 값을 출력하는 `Text('$_counter')`가 있습니다.
  * `FloatingActionButton`은 둥근 + 버튼으로, `onPressed`에 `_incrementCounter`를 연결하여 탭 할 때마다 카운터를 1 증가시키도록 하고 있습니다.

이처럼 Flutter에서는 \*\*상태(State)\*\*가 변하면 `build`를 다시 호출하여 UI를 업데이트합니다. (React의 setState와 개념적으로 유사하다고 볼 수 있습니다.) StatefulWidget을 구현하려면 위 템플릿처럼 `StatefulWidget`을 상속받는 클래스와, 그에 대응되는 `State`를 상속받는 클래스 두 개가 한 쌍으로 필요합니다. 하지만 Flutter 개발 시 이러한 보일러플레이트 코드는 Android Studio나 VS Code가 템플릿으로 자동 생성해주므로 (`stful` 입력 후 자동완성 등) 크게 부담갖지 않아도 됩니다.

**정리:** `main.dart`의 주요 위젯 계층은 `MyApp` (Stateless) 아래 `MaterialApp` -> `MyHomePage` (Stateful) -> `Scaffold` -> `AppBar`, `Body`, `FloatingActionButton` 등으로 이루어져 있습니다. 이 장에서는 `Scaffold`를 중심으로 한 기본 구조를 이해했다면, 이제 다양한 **기본 위젯들**과 화면을 구성하는 방법을 다음 장에서 알아보겠습니다.

---

## 4장: 레이아웃과 화면 구성 방법

화면에 UI 요소를 배치하는 것은 Flutter 개발의 핵심입니다. Flutter의 레이아웃은 **위젯 트리** 구조로 이루어지며, **Row**, **Column**, **Container**, **Expanded** 등 다양한 레이아웃 관련 위젯을 사용합니다. 안드로이드의 LinearLayout(수평/수직)이나 웹의 Flexbox를 떠올리면 Row와 Column의 개념을 쉽게 이해할 수 있습니다. 본 장에서는 흔히 사용하는 레이아웃 위젯과 그 속성들을 소개하고, 간단한 예제를 통해 화면 구성 방법을 익혀보겠습니다.

### Container, Padding, Margin – 기초 위젯

**Container**는 자식 위젯을 담고 배경색, 크기, 여백 등을 지정할 수 있는 기본적인 위젯입니다. 아무 설정 없는 Container는 화면에 투명하게 존재하며, 자식이 없으면 가능한 공간을 모두 차지하려고 합니다. 다음 코드를 예로 봅시다:

```dart
Container(
  color: Colors.blue,
)
```

이 Container는 파란색 배경만 있고 child가 없기 때문에, 부모 영역에서 남는 공간을 전부 차지합니다. 만약 child를 넣으면 어떻게 될까요?

```dart
Container(
  color: Colors.blue,
  child: Text('Hello'),
)
```

이 경우 Container의 크기는 child인 `Text('Hello')`의 크기에 맞춰서 작아집니다. 특별히 `width`나 `height`를 지정하지 않는 한, Container는 자식의 크기에 따라 축소됩니다. (비유하자면, 내용물을 넣고 진공포장한 봉지처럼 내용물 크기에 맞게 줄어듭니다.)

Container는 스타일을 지정할 수 있는 여러 속성을 갖습니다:

* `color`: 배경색 (decoration을 쓰면 더 다양한 장식 가능)
* `width`, `height`: 고정 너비/높이
* `padding`: 내부 여백 (안쪽 패딩)
* `margin`: 외부 여백 (바깥 여백)
* `alignment`: 자식 정렬 등

예를 들어, 다음과 같이 padding과 margin을 적용할 수 있습니다:

```dart
Container(
  color: Colors.blue,
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  margin: EdgeInsets.all(20),
  child: Text('안녕하세요'),
)
```

* `EdgeInsets.symmetric(horizontal:10)`은 좌우에 각각 10픽셀의 내부여백을 주는 설정이고, `vertical:10`까지 주면 위아래 10픽셀 여백이 추가됩니다.
* `EdgeInsets.all(20)`은 모든 방향으로 20픽셀의 외부여백(margin)을 주는 설정입니다.

위 Container는 자식 Text 주위로 패딩이 둘러져 있으므로 파란 배경 안에 텍스트가 약간 띄워져 보이고, Container 바깥으로는 20픽셀 간격을 두고 다음 위젯들이 배치됩니다.

> 📌 **Padding vs Margin:** Padding은 위젯 내부의 내용과 경계 사이 공간이고, Margin은 위젯 경계와 부모 사이의 공간입니다. Flutter에서는 Padding 위젯을 별도로 제공하기도 합니다 (`Padding(widget: child, padding: ...)`), 그러나 Container의 padding 속성을 사용해도 동일한 효과를 얻습니다.

### Row와 Column – 수평/수직 레이아웃

화면에 여러 위젯을 **가로 또는 세로로 나열**할 때 사용하는 대표적인 위젯이 **Row**(행)와 **Column**(열)입니다. Row는 가로 방향으로 children을 배치하고, Column은 세로 방향으로 children을 배치합니다. 안드로이드의 LinearLayout(horizontal/vertical)에 대응한다고 보면 됩니다.

Row와 Column 모두 **children** 속성으로 위젯 리스트를 받습니다 (한 개 이상). 즉, 둘 다 **멀티-child 레이아웃 위젯**입니다. 사용 예:

```dart
Row(
  children: [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
  ],
)
```

위 코드는 별 아이콘 세 개를 가로 일렬로 표시합니다. 반면:

```dart
Column(
  children: [
    Text('첫째 줄'),
    Text('둘째 줄'),
    Text('셋째 줄'),
  ],
)
```

는 세 개의 Text를 세로로 쌓아 표시합니다.

Row/Column에 자식이 없으면 아무런 크기도 갖지 않습니다. 자식이 하나라도 있으면, Row는 기본적으로 **가로 방향으로 자식들을 원래 크기만큼 배치**하고, Column은 **세로 방향으로 배치**합니다. 특별히 크기를 지정하지 않으면 Column은 남은 세로 공간을 모두 차지하고, Row는 남은 가로 공간을 모두 차지하지만, 각각의 children은 자체 크기만큼만 화면에 보이게 됩니다.

Row/Column의 가장 중요한 속성은 **정렬(alignment)** 관련 속성입니다:

* **mainAxisAlignment:** 주축(Main Axis) 방향으로의 정렬을 결정. Column에서는 수직(위-아래) 방향이 주축, Row에서는 수평(왼-오) 방향이 주축입니다. 가능한 값은 `MainAxisAlignment.start`(초반 정렬), `center`(중앙 정렬), `end`(후반 정렬), 그리고 `spaceBetween`, `spaceAround`, `spaceEvenly` 등이 있습니다 (자식 사이 공간을 균등 배분하는 옵션들).
* **crossAxisAlignment:** 교차축(Cross Axis) 방향으로의 정렬을 결정. Column의 교차축은 가로, Row의 교차축은 세로 방향입니다. 값으로 `CrossAxisAlignment.start` (Column이면 왼쪽 정렬, Row이면 상단 정렬), `center` (가운데 정렬), `end` (Column이면 오른쪽, Row이면 하단) 등이 있습니다. 기본값은 **CrossAxisAlignment.center**로 되어 있어서, Row나 Column 안의 자식들이 교차축 방향으로 중앙에 정렬됩니다.

예제를 통해 이해해보겠습니다. 아래는 세 개의 컨테이너를 Column으로 쌓고 정렬을 바꿔보는 코드입니다:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.start,   // 또는 .center, .end
  crossAxisAlignment: CrossAxisAlignment.start, // 또는 .center, .end
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Container(width: 50, height: 50, color: Colors.green),
    Container(width: 50, height: 50, color: Colors.blue),
  ],
)
```

* `mainAxisAlignment: MainAxisAlignment.start`로 하면 Column이 위쪽부터 차곡차곡 배치 (기본값이 start이므로 변화는 없겠죠).
* `mainAxisAlignment: MainAxisAlignment.center`로 바꾸면 세 개의 박스가 세로로 가운데 정렬되어 모입니다.
* `crossAxisAlignment: CrossAxisAlignment.start` vs `center` vs `end`로 하면, 가로 방향에서 왼쪽/가운데/오른쪽 정렬을 결정합니다.

&#x20;*Column 위젯의 `mainAxisAlignment: center` 적용 예시 — 세 개의 자식 박스가 세로 방향 중앙으로 정렬됨*

위 스크린샷에서 볼 수 있듯이, Column의 `mainAxisAlignment.center`를 적용하면 세 박스가 위아래 가운데에 모여있습니다. 기본값인 `start`일 때는 맨 위부터 붙어 있었겠죠. 이처럼 **주축 정렬**은 children들을 주축 방향으로 어떻게 분배할지 결정합니다. 마찬가지로 Row에서 `mainAxisAlignment.center`를 적용하면 가로축 방향으로 가운데 정렬될 것입니다.

CrossAxisAlignment의 효과는 Column의 경우 왼/중앙/오른 정렬, Row의 경우 상/중앙/하 정렬이라 생각하면 됩니다. 예를 들어, Row에 서로 다른 높이의 컨테이너들이 있을 때 `crossAxisAlignment.start`로 두면 상단을 기준으로 정렬되고, `end`로 두면 하단을 맞춰 정렬됩니다.

**Expanded 위젯:** Row나 Column의 children 중 하나 이상에 `Expanded` 위젯을 쓰면, 그 child는 남은 공간을 **가변적으로 차지**하게 할 수 있습니다. 예를 들어, 화면 가로폭 전체에 걸쳐 3개의 위젯을 균등 분할하려면 각각을 `Expanded(child: 컨테이너)`로 감싸면 됩니다. Expanded는 Row/Column에서만 유효하며, flex 레이아웃의 `flex-grow`와 유사하게 동작합니다.

```dart
Row(
  children: [
    Expanded(child: Container(color: Colors.red)),
    Expanded(child: Container(color: Colors.green)),
    Expanded(child: Container(color: Colors.blue)),
  ],
)
```

위 Row는 3개의 Expanded가 있으므로, 화면 가로 공간을 3등분하여 각각의 컨테이너가 1/3씩 차지합니다. 한 요소만 Expanded이고 나머지는 크기가 지정돼 있으면, Expanded는 남은 공간 전부를 차지합니다. 여러 Expanded가 있으면 `flex` 값을 설정해 비율을 조정할 수도 있습니다 (기본 flex=1씩 균등).

**정리:** Row/Column은 매우 빈번히 쓰이는 레이아웃 위젯입니다. 이들의 핵심은 **children 배열**과 **정렬 속성**입니다. Column은 세로로, Row는 가로로 위젯을 나열하고, Expanded를 사용해 공간 분할도 가능합니다. Flutter 레이아웃을 설계할 때, 먼저 큰 틀에서 Row와 Column으로 섹션을 나누고, 섹션 안에서 다시 세부 정렬을 조정하는 방식으로 접근하면 좋습니다.

### 기타 레이아웃 위젯: Stack, ListView 등

위에서 다룬 Container/Row/Column 외에도 Flutter에는 다양한 레이아웃 도구가 있습니다. 몇 가지 유용한 위젯을 소개합니다.

* **Stack:** HTML/CSS의 `position: absolute` 레이아웃처럼, 위젯을 서로 **겹쳐서** 배치할 때 사용합니다. Stack의 children들은 서로 위에 쌓이며(`Stack`), 각각의 child에 `Positioned` 위젯을 씌워 `left`, `top`, `right`, `bottom`으로 위치를 지정할 수 있습니다. Stack은 예를 들어 배지(badge)를 아이콘 위에 겹치게 놓는다든지, 배경 위에 여러 요소를 포개는 UI 등에 활용됩니다.

* **ListView:** 스크롤 가능한 리스트를 만들 때 사용하는 위젯입니다. children을 전달하는 정적 ListView도 있고, **ListView\.builder**를 사용하면 동적으로 많은 아이템을 효율적으로 표시할 수 있습니다. Android의 RecyclerView와 유사한 개념입니다. 할 일 목록 앱 등의 **스크롤 화면**이 필요할 때 ListView를 사용하게 될 것입니다.

* **GridView:** 격자(grid) 형태로 위젯들을 배치하는 위젯입니다. Count나 builder 등의 생성자를 통해 2열, 3열 그리드 레이아웃을 만들 수 있습니다.

* **Flexible/Spacer:** Row나 Column에서 Expanded와 유사하게 공간을 조절하지만, 조금 더 세밀한 제어를 할 수 있는 위젯입니다. `Spacer()` 위젯은 Expanded(child: SizedBox.shrink())과 동일하게 동작하여 빈 공간을 차지하는 간편한 방법입니다.

* **Align** 및 **Center:** 자식 위젯 하나를 특정 위치나 중앙에 배치하는 위젯입니다. Center는 Align의 특별한 경우로, child를 부모 영역 중앙에 놓습니다. Align 위젯은 `alignment: Alignment.topRight` 등으로 세밀한 정렬이 가능합니다.

각 레이아웃 위젯들은 공식 문서와 다양한 튜토리얼에 상세히 나와 있으므로, 필요할 때마다 검색해서 참고하시면 됩니다.

### 예제: 간단한 프로필 카드 레이아웃

지금까지 배운 레이아웃 위젯들을 활용하여, 간단한 프로필 카드 UI를 만들어보겠습니다. 화면 중앙에 둥근 이미지를 놓고, 그 아래 이름과 이메일이 나열된 형태를 구성해보죠.

```dart
class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(  // 화면 중앙 배치
      child: Column(
        mainAxisSize: MainAxisSize.min,  // Column 높이를 자식 높이만큼으로 최소화
        children: [
          // 1. 프로필 이미지 (원 형태)
          Container(
            width: 100, height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),  // 간격
          // 2. 이름 텍스트
          Text(
            '홍길동',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // 3. 이메일 텍스트
          Text(
            'hong@example.com',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
```

설명을 덧붙이면:

* `Center`로 화면 중앙에 Column을 놓았습니다.
* Column은 `mainAxisSize: MainAxisSize.min`으로 설정하여 children의 높이만큼만 차지하도록 했습니다 (디폴트는 max로 남는 공간을 다 차지).
* 첫 번째 child는 Container로 프로필 이미지를 원형으로 클립합니다. Container의 `decoration`을 `BoxDecoration`으로 주고 `shape: BoxShape.circle`로 하면 내용이 원형으로 클리핑 됩니다. 그리고 `DecorationImage`를 사용해 `AssetImage('...')`로 불러온 이미지를 채우고 있습니다.
* 두 번째 child는 SizedBox(height:16)로 위젯들 사이에 16픽셀의 간격을 띄웠습니다.
* 세 번째와 네 번째 children은 이름과 이메일을 표시하는 Text 위젯입니다. 이름에는 폰트 크기와 굵기를 주어 강조했고, 이메일은 약간 회색으로 처리했습니다.

이 ProfileCard 위젯을 `home: ProfileCard()` 등으로 MaterialApp에 띄워보면, 심플한 프로필 카드 화면을 확인할 수 있습니다. 이 예제를 통해 보듯이, **Container + Column + Text** 등의 조합으로 다양한 UI를 만들어낼 수 있습니다. Flutter 위젯들은 조립식 블록과 같아서, 어떻게 조합하느냐에 따라 결과물이 달라집니다. 레이아웃 설계 시 Flex(Flex=Row/Column)와 Box(Container) 개념을 잘 활용하면 원하는 디자인을 구현할 수 있습니다.

---

## 5장: 상태 관리 (State Management)

Flutter 앱 개발에서 **상태(state)** 관리는 매우 중요한 주제입니다. 작은 앱에서는 간단히 StatefulWidget과 `setState`만으로도 충분하지만, 앱 규모가 커지면 보다 체계적인 상태 관리 기법이 필요해집니다. 이 장에서는 우선 Flutter의 기본적인 상태 관리 방식과 `setState` 사용법을 다시 정리하고, 간단한 예제를 통해 **상태 변화를 UI에 반영하는 방법**을 익혀보겠습니다. 추가로, 규모가 커질 때 사용되는 Flutter 생태계의 상태 관리 패키지들에 대해서도 간략히 소개하겠습니다.

### StatefulWidget과 setState 복습

앞서 3장에서 기본 카운터 앱을 살펴보며 StatefulWidget의 사용을 봤습니다. 다시 요약하면:

* StatefulWidget은 State 객체를 통해 **변경 가능한 데이터**를 갖는다.
* State 객체 내에서 변수(상태)를 변경할 때는 반드시 `setState(() { ... })`로 감싸야 한다.
* `setState`를 호출하면 해당 위젯의 `build` 메서드가 다시 호출되어 UI가 업데이트된다.

카운터 앱의 `_MyHomePageState` 예시에서 `_counter` 변수가 상태이며, `_incrementCounter`에서 `setState`로 `_counter`를 증가시키고 있었습니다. `setState`에 전달한 함수 블록 안에서 `_counter++` 처리를 했는데, 사실 아주 짧은 코드에서는 `setState(() => _counter++);`처럼 한 줄로 쓸 수도 있습니다. 중요한 건 **값 변경 후 반드시 setState 호출**이라는 점입니다. 만약 `setState` 없이 `_counter++`만 하면 Flutter는 해당 위젯이 바뀐 줄 모르기 때문에 UI 갱신이 일어나지 않습니다.

StatefulWidget은 화면에 보여지는 부분(build)과 상태 보관 부분을 분리한 구조라서 처음엔 약간 복잡해보일 수 있습니다. 하지만 State 클래스 안에서 원하는 만큼 변수나 함수를 정의하여 로직을 구현할 수 있으므로, **화면 하나당 StatefulWidget 하나**를 만들어 관리한다고 생각하면 됩니다.

**예제: 좋아요 버튼 토글** – 간단한 StatefulWidget을 직접 만들어 보겠습니다. 누를 때마다 아이콘이 바뀌는 "좋아요(Like)" 버튼을 구현해보죠.

```dart
class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _liked = false;  // 상태: 좋아요 여부

  void _toggleLike() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _liked ? Icons.favorite : Icons.favorite_border,
        color: _liked ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleLike,
    );
  }
}
```

설명:

* `_liked`라는 bool 상태를 가지고, 초기값은 false (좋아요 안 누른 상태).
* `_toggleLike` 함수에서 `_liked`를 반전시키고, 이를 `setState`로 감싸 상태를 업데이트.
* `build`에서는 `IconButton` 위젯을 리턴하는데, 아이콘을 `_liked` 값에 따라 **가득 찬 하트** 또는 **빈 하트** 아이콘으로 표시합니다. 색상도 빨간색/회색으로 토글.
* `onPressed`에 `_toggleLike`를 연결하여 누를 때 상태를 변경하고 UI를 갱신하도록 합니다.

이 LikeButton 위젯을 화면에 배치하면, 유저가 탭할 때마다 하트 모양이 변하는 것을 볼 수 있습니다. Flutter에서 이 정도의 간단한 상호작용은 StatefulWidget + setState로 충분히 구현 가능합니다.

**주의:** `setState`로 감싸는 코드에서는 **가능한 한 UI에 반영되는 상태 값의 변경만** 포함해야 합니다. 부수효과가 있거나 오래 걸리는 작업을 setState 안에서 하면 안됩니다. 예를 들어, 네트워크 호출을 하고 그 응답으로 상태를 변경한다면, `await`으로 데이터를 받아온 후에 setState로 결과를 반영해야 합니다. 잘못된 예:

```dart
// 잘못된 사용 - setState 안에서 오래 걸리는 작업 하지 말 것!
setState(() {
  var data = http.get(...);  // 네트워크 호출 (이렇게 하면 안됨)
  _items = parseData(data);
});
```

이렇게 하면 UI 갱신 동기와 프레임 관리에 문제가 생길 수 있습니다. 항상 **setState는 UI 상태값 업데이트만 한다**고 기억하세요.

### Flutter의 주요 상태 관리 패턴 소개

Flutter 커뮤니티에서는 다양한 **상태 관리(State Management) 패턴**이 활용됩니다. 간단히 몇 가지를 소개합니다 (이 교재에서는 깊이 다루지 않지만, 이후 학습 방향을 위해 알아둡니다):

* **Provider 패턴:** 구글이 권장하는 방식 중 하나로, InheritedWidget을 손쉽게 쓸 수 있도록 한 패키지입니다. 앱 전역 상태나 하위 위젯들에게 공유할 상태를 Provider로 감싸고, `Consumer`나 `Provider.of`를 통해 접근합니다. 비교적 간단하고 공식 문서에도 사례가 많습니다.
* **BLoC 패턴 (Business Logic Component):** RxDart 등의 Streams를 활용한 패턴으로, UI와 로직을 분리하는 아키텍처입니다. 이벤트와 상태를 Stream으로 처리하여 명확한 데이터 흐름을 갖는 것이 장점입니다. 다만 소규모 앱에는 다소 과할 수 있습니다.
* **Riverpod:** 최근 각광받는 상태관리 패키지로 Provider의 개선판이라고 볼 수 있습니다. 전역적으로 상태를 관리하고 의존성 주입/생성을 체계화한 것이 특징입니다.
* **Redux/MobX:** React에서 쓰이는 Redux 아키텍처를 Flutter에 도입한 패턴이나, Observable 기반의 MobX 등도 있습니다. 그러나 Flutter에서는 위의 Provider나 Riverpod 쪽이 더 idiomatic하다고 여겨집니다.

소규모 프로젝트에서는 **Provider**로도 충분하고, 아주 간단한 건 오히려 그냥 StatefulWidget 여러 개로 나눠 관리해도 됩니다. 예를 들어 부모 StatefulWidget에서 상태를 관리하고 자식 Stateless에게 값을 props로 내려주는 형태도 가능합니다.

이 교재의 실전 프로젝트(9장)에서는 복잡한 상태 관리 패키지 없이 기본 setState와 간단한 상태 공유만으로 구현해 볼 예정입니다. 하지만 프로젝트를 확장할 때를 대비하여 위와 같은 패턴이 있다는 것을 기억해두세요.

### 상태 관리 예제: Todo 항목 완료 처리

상태 관리의 이해를 돕기 위해, **할 일(Todo) 항목 리스트**를 관리하는 간단한 화면을 생각해봅시다. 체크박스를 눌러 완료 여부를 토글하는 상황입니다. 각 Todo 항목을 Stateful로 만들어도 되지만, 항목들이 모인 리스트 전체를 StatefulWidget으로 관리해보겠습니다:

```dart
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todo 항목 모델 정의
  class Todo {
    String title;
    bool completed;
    Todo(this.title, {this.completed = false});
  }

  List<Todo> _todos = [
    Todo('Flutter 공부하기'),
    Todo('주말 산책'),
    Todo('이메일 확인하기'),
  ];

  void _toggleCompleted(int index) {
    setState(() {
      _todos[index].completed = !_todos[index].completed;
    });
  }

  void _addTodo(String title) {
    setState(() {
      _todos.add(Todo(title));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 목록')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (_) => _toggleCompleted(index),
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새 할 일 추가 (예제에선 고정 텍스트로 추가)
          _addTodo('새 할 일');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

이 예제에서:

* `_todos` 리스트에 Todo 모델 객체들을 관리합니다. 각 Todo는 제목과 완료 여부를 갖습니다.
* `_toggleCompleted(index)`는 해당 인덱스의 Todo의 완료 상태를 true/false 토글하며 setState로 상태를 갱신합니다.
* `_addTodo(title)`는 새로운 Todo를 리스트에 추가하고 UI를 갱신합니다.
* `build` 메서드에서는 `ListView.builder`를 사용해 \_todos 리스트를 화면에 렌더링합니다. 각 항목은 `ListTile`로 표현했고, 왼쪽에 `Checkbox` 위젯을 두어 완료 여부를 표시 및 제어합니다. Checkbox의 `onChanged`에서는 `_toggleCompleted(index)`를 호출하여 상태를 변경합니다.
* Todo가 완료되면 Text에 취소선(strikethrough)을 긋고 색상을 회색으로 변경해 시각적으로 구분했습니다.

FloatingActionButton의 `onPressed`에서는 간단하게 `_addTodo('새 할 일')`을 호출하도록 해 두었습니다. 실제 앱 같으면 다이얼로그나 별도 화면에서 제목을 입력받아 추가하겠지만, 여기서는 동작 예시만 보여드립니다.

이 TodoListPage 전체가 하나의 StatefulWidget으로, 자기 내부에서 상태 리스트를 관리하는 구조입니다. 작은 앱에서는 이처럼 페이지 단위로 Stateful하게 만들어도 무방합니다. 만약 Todo 항목이 매우 복잡해지거나, 다른 페이지와 상태를 공유해야 한다면 Provider 등을 고려해볼 수 있겠지만, 우선은 기본에 충실한 구현으로 시작하는 것이 좋습니다.

> 📝 **상태 관리 요약 TIP:** Flutter에서 상태를 어디에 둘지 결정할 때, \*\*“공유되어야 하는 범위”\*\*를 생각하세요. 만약 특정 위젯과 그 하위 위젯들만 필요로 하는 상태라면 그 부분만 StatefulWidget으로 만들면 됩니다. 여러 페이지에 걸쳐 공유되어야 하는 상태라면 (예: 사용자 인증 정보 등) Provider 등의 상위 상태 관리가 필요합니다. 이렇듯 state의 **범위**와 **수명주기**를 고려하여 설계하는 것이 상태 관리의 핵심입니다.

---

## 6장: 화면 전환과 라우팅

대부분의 앱은 하나의 화면(Screen)으로만 구성되지 않고, 여러 화면 간 \*\*이동(Navigation)\*\*이 필요합니다. Flutter에서는 이를 \*\*라우팅(Routing)\*\*이라고 부르며, Android의 Activity 전환이나 iOS의 ViewController 전환에 대응합니다. 이번 장에서는 Flutter에서 새로운 화면으로 이동하고 돌아오는 기본 방법과, 여러 페이지를 관리하는 몇 가지 라우팅 기법을 다룹니다.

### Navigator와 Route 기본

Flutter는 **스택(Stack)** 구조로 화면 이동을 관리합니다. `Navigator` 위젯이 화면의 스택을 관리하며, 새로운 화면을 보여줄 때는 **push**, 화면을 닫을 때는 **pop** 개념을 사용합니다. `Navigator.push`를 호출하면 현재 화면 위에 새로운 Route(화면)가 쌓이고, `Navigator.pop`을 호출하면 현재 화면을 스택에서 제거하고 이전 화면으로 돌아갑니다.

가장 간단한 화면 전환 방법은 **`Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()))`** 형태를 사용하는 것입니다. 예를 들어, `MainPage`에서 `DetailPage`로 이동한다고 가정하면:

```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(itemId: 42)),
    );
  },
  child: Text("상세 페이지로 이동"),
)
```

위 버튼을 누르면 `DetailPage` 화면이 생성되어 현재 화면 위에 표시됩니다. `MaterialPageRoute`는 안드로이드 Material 디자인 특유의 화면 전환 애니메이션(슬라이드 효과 등)을 적용하는 내장 Route 클래스입니다. `DetailPage(itemId: 42)`처럼 화면 전환 시 생성자 인자를 넘겨 데이터도 전달할 수 있습니다.

새로운 화면(`DetailPage`)에서는 이전 화면으로 돌아가기 위해 `Navigator.pop(context)`를 호출하면 됩니다. Flutter에서 상단 AppBar에 자동으로 생기는 뒤로가기 화살표(←) 버튼도 내부적으로 `Navigator.pop`을 호출해줍니다. (안드로이드의 기기 back 버튼 역시 자동 연동됩니다.)

**예제: 간단한 화면 이동** – 두 페이지가 있는 앱을 만들어보겠습니다. 첫 번째 페이지에서 버튼을 누르면 두 번째 페이지로 이동하고, 두 번째 페이지에서 다시 돌아오는 예제입니다.

```dart
// 첫 번째 화면
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('첫 번째 화면')),
      body: Center(
        child: ElevatedButton(
          child: Text('다음 화면 열기'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage(data: "Hello")),
            );
          },
        ),
      ),
    );
  }
}

// 두 번째 화면
class SecondPage extends StatelessWidget {
  final String data;
  const SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두 번째 화면'),
        leading: IconButton( // 커스텀 뒤로가기 버튼 (AppBar 자동 제공 back 버튼과 동일한 기능)
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "OK");  // pop 하면서 "OK" 데이터 반환
          },
        ),
      ),
      body: Center(
        child: Text('전달받은 데이터: $data'),
      ),
    );
  }
}
```

**설명:** 첫 번째 화면(FirstPage)은 ElevatedButton을 하나 가지고, 누르면 SecondPage로 이동합니다. SecondPage를 `MaterialPageRoute`로 push하면서 `data: "Hello"`라는 값을 생성자 인자로 넘겼습니다. SecondPage에서는 그 값을 받아 화면에 텍스트로 보여줍니다. SecondPage의 AppBar에 leading 아이콘으로 직접 뒤로가기 버튼을 구현했고, `Navigator.pop(context, "OK")` 호출로 화면을 닫으며 문자열 `"OK"`를 반환했습니다.

`Navigator.pop`에 두 번째 인자를 주면, 이전 화면으로 데이터를 돌려줄 수 있습니다 (Android의 setResult 같은 개념). 따라서 FirstPage에서 SecondPage를 열 때 `Navigator.push`를 `async`/`await`으로 호출하면, pop시 전달된 값을 받을 수 있습니다:

```dart
onPressed: () async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondPage(data: "Hello")),
  );
  print("SecondPage에서 받은 결과: $result");  // "OK" 출력
},
```

이처럼 Future로 리턴되는 push의 결과를 await하면, 새 화면이 pop되면서 전달된 `"OK"`를 `result`로 받게 됩니다.

### Named Routes (이름있는 라우트)

위의 방식은 **명시적으로 위젯 클래스를 생성**하여 경로를 전환하는 방법입니다. Flutter에서는 라우트를 문자열 이름으로 정의하고 `Navigator.pushNamed`로 이동하는 기법도 있습니다. 프로젝트 규모가 커져 화면이 많아지면, MaterialApp에 **routes 테이블**을 미리 등록해두고 필요할 때 이름으로 호출할 수 있습니다.

예를 들어, `MaterialApp`을 설정할 때:

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
    '/profile': (context) => ProfilePage(),
  },
)
```

이렇게 `routes` 맵에 라우트 이름과 위젯 빌더를 등록해두면, 앱 실행 시 initialRoute `'/'`에 해당하는 HomePage가 열립니다. 그리고 어디서든 `Navigator.pushNamed(context, '/profile')`처럼 호출하면 ProfilePage로 전환됩니다. 이때 pushNamed로 이동할 때 arguments를 전달할 수도 있습니다:

```dart
Navigator.pushNamed(
  context, 
  '/profile', 
  arguments: {'userId': 123},
);
```

그리고 ProfilePage의 `build`에서 `ModalRoute.of(context)!.settings.arguments`로 전달된 인자를 받을 수 있습니다.

Named routes의 장점은 **앱의 화면 구조를 한 곳에서 정의**할 수 있고, 문자열로 경로를 관리하므로 코드가 간결해진다는 것입니다. 다만, 규모가 작은 앱에서는 크게 필요하지 않을 수 있고, IDE 리팩토링 등이 위젯 참조보다 어렵다는 단점도 있습니다. 최근에는 GetX 라우팅이나 go\_router 패키지 등도 각광받고 있습니다만, 이 교재에서는 기본 Navigator 사용에 집중하겠습니다.

### Dialog나 Drawer 등도 Navigator 사용

Navigator는 전체 화면 전환 외에도 \*\*다이얼로그(Dialog)\*\*를 띄울 때도 사용됩니다. `showDialog` 함수 내부적으로 Navigator overlay에 새로운 route를 푸시하여 모달 창을 띄웁니다. 예를 들어:

```dart
showDialog(
  context: context, 
  builder: (context) => AlertDialog(
    title: Text('알림'),
    content: Text('정말 삭제하시겠습니까?'),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: Text('취소')),
      TextButton(onPressed: () {
        // 삭제 로직 수행
        Navigator.pop(context);
      }, child: Text('확인')),
    ],
  ),
);
```

이 코드에서 두 개의 TextButton 모두 `Navigator.pop(context)`를 호출하여 다이얼로그를 닫고 있습니다. (필요하면 `pop(context, resultValue)`로 결과를 전달할 수도 있습니다.)

또한, AppBar에 설정하는 Drawer (메뉴 패널) 역시 Navigator와는 별개지만 화면 전환의 한 형태로 생각할 수 있습니다. Drawer는 Navigator.push 대신 `Scaffold.of(context).openDrawer()`로 열리지만, 내부 메뉴 항목을 탭하면 Navigator로 화면 이동을 하게 됩니다.

### 페이지 라이프사이클과 Navigator

한 페이지에서 다른 페이지로 이동하면 이전 페이지는 일시적으로 비활성 상태가 됩니다. 이때 State 객체의 `initState`, `dispose` 같은 라이프사이클 메서드 호출 여부에 유의해야 합니다:

* A 페이지 -> B 페이지로 push 하면: A 페이지의 State는 `dispose`되지 않고 그대로 메모리에 유지됩니다. B 페이지가 나타나지만, A는 Navigator 스택 아래에 남아 있는 상태입니다.
* B 페이지에서 pop하여 A로 돌아오면: A 페이지의 State의 `build`가 다시 호출될 수도 있고 (만약 돌아오면서 state 변경된 게 있으면), 아무 변경 없으면 기존 상태를 그대로 보여줍니다.
* popUntil 이나 pushReplacement 등으로 중간 페이지를 빼거나 교체하면, 그에 따라 해당 State들은 dispose됩니다.

이를 고려하여, 화면에 들어오고 나갈 때 리소스 해제나 재개 등이 필요하다면 `dispose`나 `didPopNext` (RouteAware 믹스인 활용) 등을 사용해야 합니다. 다만 간단한 앱에서는 큰 고려없이 setState로 필요한 시점에 UI를 업데이트하는 것으로 충분합니다.

---

## 7장: 외부 패키지 활용하기

Flutter 개발의 생산성을 높여주는 요소 중 하나가 **방대한 외부 패키지** 들입니다. Flutter의 패키지 생태계는 pub.dev라는 저장소를 중심으로 발전하고 있으며, UI 컴포넌트부터 네트워킹, 상태관리, 각종 유틸까지 다양한 패키지를 무료로 사용할 수 있습니다. 이 장에서는 외부 패키지를 프로젝트에 추가하는 방법과, 간단한 예시를 통해 패키지 사용법을 소개합니다.

### pubspec.yaml과 패키지 추가

Flutter 프로젝트에서 외부 라이브러리를 사용하려면, **pubspec.yaml** 파일의 `dependencies` 섹션에 해당 패키지 이름과 버전을 추가해야 합니다. `pubspec.yaml`은 프로젝트 루트에 있으며, 프로젝트 생성 시 기본적으로 `cupertino_icons` 같은 패키지가 예제로 한두 개 포함되어 있습니다.

예를 들어, Dart 패키지 중 무작위 영어 단어를 생성해주는 유명한 패키지 **english\_words**를 추가해보겠습니다. pub.dev에서 `english_words`를 검색하면 최신 버전이 보이는데 (현재 시점 4.0.0 등), 이를 pubspec.yaml에 추가합니다. 편집 예:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.0
  english_words: ^4.0.0
```

위처럼 `cupertino_icons` 아래 새 줄에 `english_words: ^4.0.0`을 추가해 저장합니다. 버전 앞의 캐럿(^) 표시는 해당 메이저 버전 내에서 최신 버전을 사용하겠다는 의미입니다. 파일을 저장하면, IDE가 자동으로 `flutter pub get` (옛 `flutter packages get`) 명령을 실행하여 패키지를 다운로드 및 설치합니다. 만약 자동 실행되지 않으면 수동으로 터미널에서 `flutter pub get`을 실행하세요.

성공적으로 설치되면, 프로젝트 폴더의 `.dart_tool`에 패키지 소스가 캐시되고, `pubspec.lock` 파일에 버전이 기록됩니다. 이제 Dart 코드에서 해당 패키지를 **import**하여 사용할 수 있습니다.

```dart
import 'package:english_words/english_words.dart';
```

대부분 패키지의 import 경로는 `package:패키지이름/파일.dart` 형식입니다. 어떤 파일을 import해야 할지는 보통 패키지의 README나 pub.dev 설명에 나와 있습니다. `english_words`의 경우 `english_words.dart`를 import하면 되고, 여기에 유용한 클래스 `WordPair` 등이 정의되어 있습니다.

### 패키지 활용 예제: 랜덤 영단어 생성

`english_words` 패키지는 5000개 이상의 영단어 리스트를 내장하고 있고, `WordPair.random()` 메서드를 통해 두 단어로 구성된 랜덤 조합을 만들어줍니다. 공식 Flutter 튜토리얼에서도 자주 등장하는 예제인데, 이 패키지를 활용해 간단한 앱을 만들어보겠습니다.

**목표:** 앱 시작 시 랜덤한 영어 단어 조합을 화면에 표시하고, 버튼을 누를 때마다 새로운 단어 조합으로 갱신.

1. pubspec.yaml에 `english_words`를 추가 및 `flutter pub get` 실행 (이미 완료했다고 가정).
2. main.dart 코드:

```dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Words',
      home: RandomWordsPage(),
    );
  }
}

class RandomWordsPage extends StatefulWidget {
  @override
  _RandomWordsPageState createState() => _RandomWordsPageState();
}

class _RandomWordsPageState extends State<RandomWordsPage> {
  late WordPair _wordPair;

  @override
  void initState() {
    super.initState();
    _wordPair = WordPair.random(); // 초기 단어 생성
  }

  void _generateNewWord() {
    setState(() {
      _wordPair = WordPair.random();
    });
  }

  @override
  Widget build(BuildContext context) {
    final word = _wordPair.asPascalCase; // 예: "SkyBlue" 형태
    return Scaffold(
      appBar: AppBar(title: Text('랜덤 단어 생성기')),
      body: Center(
        child: Text(
          word,
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateNewWord,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
```

**설명:**

* `english_words`에서 제공하는 `WordPair` 클래스를 사용했습니다. `WordPair.random()`은 such as "flutter" + "developer" => "FlutterDeveloper" 식의 두 단어를 무작위로 조합한 객체를 리턴합니다. `asPascalCase` 속성은 두 단어를 결합하여 첫 문자를 대문자로 만든 String을 반환합니다 (예: "flutter developer" -> "FlutterDeveloper").
* `_RandomWordsPageState`에서는 `_wordPair`라는 상태를 가지고, FloatingActionButton 누르면 `_generateNewWord`가 호출되어 새로운 random WordPair를 생성하고 `setState`로 상태를 변경합니다.
* 처음 시작 시에도 `initState`에서 한 번 `_wordPair`를 초기화해두었습니다.
* UI는 `Center -> Text`로 단어를 크게 보여주고, FAB를 누르면 단어가 갱신됩니다.

위 코드에서 `Center` 위젯 앞의 `const` 키워드를 제거한 부분이 눈에 띄는데요, 이건 패키지 사용과 직접적으로 관련은 없지만 주의할 점입니다. `const Text(...)`처럼 상수 위젯으로 선언된 경우 그 내용이 변경되지 않는다고 가정하기 때문에, `_wordPair`가 바뀌어도 Text가 갱신되지 않습니다. 그러므로 runtime에 변경되는 값을 표시하는 위젯은 `const`를 제거해야 합니다. 위 코드에서는 word 변수가 바뀔 때마다 Text 내용이 변해야 하므로 `child: Text(word, ...)`로 const 없이 작성했습니다.

실행해보면, 앱을 열 때마다 임의의 영단어 조합이 화면에 표시되고, 새로고침 아이콘(FAB)을 누를 때마다 단어가 바뀌는 것을 확인할 수 있습니다. 이 예제는 Flutter 공식 codelab의 첫 단계이기도 합니다.

### 또 다른 패키지 예: HTTP 요청

네트워크 통신이 필요한 경우, Dart 내장 `dart:io`의 HttpClient를 쓸 수도 있지만 Flutter에서는 주로 **http 패키지** (pub.dev의 [http](https://pub.dev/packages/http))를 사용합니다. 이 패키지도 pubspec에 추가하여 쉽게 사용할 수 있습니다.

예를 들어, 간단히 인터넷에서 데이터를 가져오려면:

```yaml
dependencies:
  http: ^0.13.5
```

추가 후 코드:

```dart
import 'package:http/http.dart' as http;

Future<void> fetchSample() async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    print("성공: ${response.body}");
  } else {
    print("실패: ${response.statusCode}");
  }
}
```

위 코드는 JSONPlaceholder라는 공개 API에서 todo 항목 하나를 가져오는 예입니다. `http.get`으로 GET 요청을 보내고, 응답 상태코드가 200이면 `response.body`에 JSON 문자열이 담겨옵니다. 실제 앱에서는 이 JSON을 Dart의 `json.decode`로 파싱하여 사용하겠지만 여기서는 생략합니다. (http 패키지 사용 시 Android의 앱 권한(퍼미션) 설정도 필요없습니다. Flutter는 기본적으로 인터넷 퍼미션이 AndroidManifest에 포함되어 있습니다.)

### 패키지 선택과 문서 읽기

pub.dev에는 정말 다양한 패키지들이 있습니다. 필요한 기능이 생기면 먼저 검색해보고, 인기 있거나 Null-safety 지원되는 최신 패키지를 찾아서 쓰면 됩니다. 패키지 페이지에는 설치 방법과 간단한 사용 예제가 있으니 꼭 읽어보세요. 또한 GitHub 레포 링크를 따라가 더 상세한 README를 참고하거나, **Example** 탭을 확인하면 실사용 코드를 볼 수 있습니다.

* UI 컴포넌트 예: carousel\_slider (이미지 캐러셀), flutter\_svg (SVG 이미지 표시), image\_picker (사진 갤러리/카메라 열기)
* 기능 예: shared\_preferences (로컬 저장소 key-value), url\_launcher (외부 브라우저 열기 등), firebase\_core / cloud\_firestore / firebase\_auth (Firebase 관련, 다음 장에서 다룸)
* 플랫폼 채널 예: device\_info\_plus (디바이스 정보 얻기), connectivity\_plus (네트워크 연결 상태 체크) 등

패키지를 추가할 때 버전 관리를 위해 pubspec.yaml의 version를 잘 지정하세요. `^`로 시작하면 자동 업그레이드에 우호적이지만, 가끔 breaking change가 생길 수 있으니, 안정적인 버전을 고정하거나, `flutter pub upgrade` 전에는 ChangeLog를 확인하는 습관도 좋습니다.

> 🐛 **패키지 사용 시 유의점:** 외부 패키지를 추가하고 나면 `flutter pub get` 후 프로젝트를 \*\*재시작(Hot restart)\*\*해야 새로운 패키지가 인식됩니다. Hot reload만으로는 인식되지 않을 수 있습니다. 또한 iOS의 경우 Pods install이 자동 실행되고 나서 빌드해야 하므로 첫 빌드 때 시간이 조금 더 걸릴 수 있습니다.

---

## 8장: Firebase 연동

모바일 앱 개발에서 **백엔드 서비스**로 자주 사용되는 것이 Google의 **Firebase**입니다. Firebase는 실시간 데이터베이스, 인증, 푸시 알림, 스토리지 등 다양한 기능을 제공하는 MBaaS(Mobile Backend as a Service) 플랫폼입니다. Flutter는 Firebase와 궁합이 좋아서, 공식적으로 Flutter용 Firebase 플러그인을 지원하며 통합도 비교적 쉬운 편입니다.

이번 장에서는 **Firebase를 Flutter 프로젝트에 연결하는 방법**과, Firebase의 여러 서비스 중 **Firestore 데이터베이스**를 연동하여 간단히 데이터 저장/조회하는 실습을 해보겠습니다. (Firebase Authentication 등도 원리는 비슷하나, 시간 관계상 Firestore 위주로 다룹니다.)

### Firebase 프로젝트 설정 및 FlutterFire CLI

Firebase를 사용하려면 먼저 [Firebase 콘솔](https://console.firebase.google.com/)에서 프로젝트를 생성해야 합니다. 프로젝트 이름은 자유롭게 지정하고 생성 과정을 완료하세요 (Google Analytics는 필요에 따라 활성화).

이후, **Firebase에 앱 등록**을 해야 합니다. Firebase 콘솔의 프로젝트 설정에서 **앱 추가**를 선택합니다. Android 앱을 추가할 경우 앱의 \*\*패키지 이름(applicationId)\*\*을 입력해야 하는데, Flutter 프로젝트 생성 시 지정한 `com.example.my_app` 등의 패키지명을 입력하면 됩니다. (또는 `android/app/src/main/AndroidManifest.xml`에 있는 `package` 값을 참고). iOS 앱도 추가하려면 iOS Bundle ID가 필요한데, iOS 설정을 하지 않을 경우 생략해도 됩니다.

앱 추가를 마치면 **Google 서비스 파일**을 다운로드하라는 안내가 나옵니다:

* Android: `google-services.json`
* iOS: `GoogleService-Info.plist`

각각 파일을 받아 Flutter 프로젝트의 해당 위치에 넣어야 합니다:

* `google-services.json` -> `android/app/` 폴더에 복사
* `GoogleService-Info.plist` -> `ios/Runner/` 폴더에 복사 (Xcode 열어서 추가하거나, 명령어 사용)

또한 Android의 `android/build.gradle`과 `android/app/build.gradle` 파일에 Google Services 플러그인을 적용하는 설정을 추가해야 합니다 (classpath와 apply plugin). 이것은 Firebase 공식 문서에 안내되어 있으니 따라하면 됩니다. 하지만, **FlutterFire CLI**라는 도구를 사용하면 수작업을 많이 줄일 수 있습니다.

**FlutterFire CLI 사용법:**

1. 터미널에서 프로젝트 폴더로 이동.
2. Firebase CLI (firebase-tools) 전역 설치 (한번만 하면 됨):

   ```bash
   npm install -g firebase-tools
   ```


그리고 `firebase login` 명령으로 Google 계정 로그인.
3\. FlutterFire CLI 활성화:

```bash
dart pub global activate flutterfire_cli
```


(최신 Flutter SDK에서는 `flutterfire` 명령이 내장되어 있을 수도 있습니다.)
4\. Flutter 프로젝트를 Firebase에 연결:

```bash
flutterfire configure
```


이 명령을 실행하면 Firebase 프로젝트를 선택하라고 나옵니다. 콘솔에서 생성한 프로젝트를 선택하면, Android/iOS/web 등 연동할 플랫폼을 선택하는 단계가 나옵니다. Spacebar로 원하는 플랫폼을 체크하고 Enter. 그러면 `google-services.json`과 iOS plist 설정, Gradle 설정 등이 **자동으로 적용**됩니다. (내부적으로 위 설정 파일들을 프로젝트에 추가하고, `firebase_options.dart`라는 파일을 생성합니다.)

만약 `flutterfire configure` 실행 시 "Flutter 앱 프로젝트가 아니다"라는 오류(FlutterAppRequiredException)가 나오면, 터미널 현재 위치가 Flutter 프로젝트 루트가 아닌지 확인하세요. 프로젝트 최상위 경로에서 다시 실행하면 됩니다.

CLI 설정이 완료되면, `lib/firebase_options.dart` 파일이 생깁니다. 이제 Flutter에서 Firebase를 초기화할 준비가 된 것입니다.

### Firebase 초기화 및 Firestore 사용

Firebase 플러그인들은 pub.dev의 **flutterfire** 시리즈 패키지로 제공합니다. 예를 들어 core 초기화는 `firebase_core` 패키지, Firestore 데이터베이스는 `cloud_firestore` 패키지를 사용합니다. pubspec.yaml에 다음을 추가하고 `flutter pub get` 실행:

```yaml
dependencies:
  firebase_core: ^2.4.1
  cloud_firestore: ^4.4.3
```

(버전은 글 작성 시점의 예시이며, pub.dev 최신 버전을 참고하세요.)

앱 시작 시 Firebase 초기화를 해야 합니다. 보통 `main()` 함수에서 비동기로 Firebase.initializeApp()을 호출합니다. 생성된 `firebase_options.dart`가 여기에 쓰입니다.

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```

위 코드에서 `WidgetsFlutterBinding.ensureInitialized()`는 비동기 초기화를 하기 위해 Flutter 엔진 바인딩을 먼저 초기화하는 코드입니다. 그 후 `Firebase.initializeApp`에 `options` 인자로 플랫폼별 기본 옵션을 넣습니다. 이 options 객체는 flutterfire CLI가 생성한 firebase\_options.dart에 정의되어 있습니다. 이렇게 하면 Firebase SDK가 앱 내에서 초기화되어 사용할 준비가 됩니다. (`google-services.json`에 있는 정보들이 내부적으로 쓰입니다.)

**Firestore 사용하기:** 이제 `cloud_firestore` 패키지의 API를 사용해보겠습니다. Firestore는 NoSQL 문서형 데이터베이스로, 데이터를 **컬렉션(Collection)** > **문서(Document)** 구조로 저장합니다. 예를 들어 "messages"라는 컬렉션에 여러 메시지 문서를 추가하거나 조회할 수 있습니다.

우선 Firestore 인스턴스를 가져옵니다:

```dart
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
```

* **데이터 쓰기 (추가):**

```dart
Future<void> addMessage(String text) {
  return firestore.collection('messages').add({
    'text': text,
    'timestamp': FieldValue.serverTimestamp(),
  });
}
```

이 함수는 "messages" 컬렉션에 새로운 문서를 만들고 {'text': ..., 'timestamp': ...} 데이터를 저장합니다. `add`를 쓰면 문서 ID는 자동 생성됩니다. `FieldValue.serverTimestamp()`는 서버 시간 값을 넣는 Firestore 특수 값입니다.

* **데이터 읽기 (한번 가져오기):**

```dart
Future<void> fetchMessagesOnce() async {
  QuerySnapshot snapshot = await firestore.collection('messages').get();
  for (var doc in snapshot.docs) {
    print(doc.data());  // 각 doc.data()가 Map<String, dynamic>
  }
}
```

`.get()`을 호출하면 일회성으로 현 시점의 데이터를 가져옵니다. QuerySnapshot 안에 여러 DocumentSnapshot이 있고, `docs` iterable로 접근합니다.

* **데이터 실시간 수신 (스트림):** Firestore의 강력한 기능 중 하나는 **실시간 업데이트 스트림**입니다. `collection('messages').snapshots()`를 호출하면 `Stream<QuerySnapshot>`이 반환되고, 이 스트림을 `StreamBuilder` 위젯으로 UI에 연결하면 데이터가 바뀔 때마다 자동으로 새로운 스냅샷을 받습니다. 예:

```dart
StreamBuilder<QuerySnapshot>(
  stream: firestore.collection('messages').orderBy('timestamp').snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    final docs = snapshot.data!.docs;
    return ListView(
      children: docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ListTile(title: Text(data['text'] ?? '<빈 메시지>'));
      }).toList(),
    );
  },
)
```

위 코드 조각은 Firestore "messages" 컬렉션을 timestamp 순으로 정렬해서 실시간 구독하는 스트림을 가져와 ListView로 보여주는 예입니다. `snapshot.data!.docs`는 문서 리스트이며, 각 doc의 `data()`를 Map으로 변환해 'text' 필드를 꺼내 썼습니다.

이처럼 Firebase Firestore를 쓰면, 실시간으로 여러 클라이언트 간 데이터 동기화가 가능하고, 기본적인 CRUD(Create/Read/Update/Delete)를 쉽게 구현할 수 있습니다. Flutter용 Firestore 패키지는 StreamBuilder와 궁합이 좋아서, 거의 리액티브 프로그래밍에 가깝게 UI와 데이터를 동기화할 수 있습니다.

**주의:** Firebase 연동 후 앱을 실행하면, 최초 실행 시 “Firebase CLI에 로그인되지 않았다”거나 "API 키 문제" 등의 오류가 콘솔에 뜰 수 있습니다. 대개는 설정이 누락되어서인데, flutterfire CLI를 썼다면 그런 일이 드뭅니다. 그래도 안 된다면 `google-services.json` 위치, Gradle 설정 등을 재검토하세요. iOS의 경우 `Podfile`에 `platform :ios, '10.0'` 이상이 설정되어야 Firebase가 동작합니다.

마지막으로, Firebase 기능들은 Firebase 콘솔에서 **보안 규칙(Security Rules)** 설정을 해야 쓰기/읽기 권한이 생기는 경우가 많습니다. 테스트 단계에서는 보안을 완화하거나, 콘솔에서 규칙을 적절히 설정해두세요. 예를 들어 Firestore 규칙을 개발 중에는 그냥 공개 허용해놓고 (`read, write: allow all`), 출시 전 강화하는 식으로 합니다.

---

## 9장: 실전 프로젝트 – 할 일 목록 앱 만들기

지금까지 배운 내용을 종합하여, 하나의 간단한 앱을 처음부터 만들어보겠습니다. 주제는 \*\*"할 일 목록 (Todo) 앱"\*\*입니다. 이 앱은 사용자가 할 일을 추가하고, 완료한 항목을 표시하며, 앱을 닫았다 켜도 데이터가 유지되도록 해보겠습니다. 데이터 유지를 위해 Firebase의 Firestore를 백엔드로 활용하여, 클라우드에 할 일 목록을 저장해보겠습니다. 또한 상태 관리는 기본적인 setState로 처리하되, 앱의 구조상 전역 상태가 필요하므로 조금 응용하여 구현해보겠습니다.

### 프로젝트 개요

앱 기능:

* 할 일 목록 보기 (체크박스로 완료 표시)
* 새로운 할 일 추가 (텍스트 입력 다이얼로그)
* 할 일 삭제 (스와이프 혹은 길게 누르기 등 UI 제공)
* Firebase Firestore에 목록을 저장하여 영구 보존 (로그인 인증 없이 public collection 사용)

화면 구성:

* 단일 페이지 앱으로, Scaffold + ListView로 목록 표시
* FloatingActionButton으로 새 할 일 추가 동작
* 각 항목은 ListTile + Checkbox로 구성

패키지 사용:

* `cloud_firestore` (파이어스토어 연동)
* (필요 시) `firebase_core` 등 Firebase 기본 초기화

사전 준비:

* 8장에서 Firebase 연동 단계를 따라 프로젝트를 Firebase에 연결하고 firebase\_core/cloud\_firestore 패키지를 추가하세요.
* Firebase 콘솔에서 Firestore 데이터베이스를 활성화하세요 (프로젝트 생성 후 Firestore 사용 설정).

### UI 구현 및 상태 관리 설계

우리는 Todo 리스트 데이터를 Firestore에 저장하면서도, 앱 실행 중에는 실시간 반영하도록 만들 것입니다. Firestore의 스트림 기능을 사용하면 편하지만, 여기서는 교육 목적으로 한 번 가져오기 + setState 관리 방식을 보여주겠습니다. (스트림 사용은 8장에서 이미 다뤘으니, 실제 작업 시 선호에 따라 적용 가능)

우선 Todo 데이터를 표현하는 클래스를 정의하겠습니다:

```dart
class TodoItem {
  String id;
  String title;
  bool completed;
  TodoItem({required this.id, required this.title, this.completed = false});

  // Firestore 문서로부터 객체 생성하는 팩토리
  factory TodoItem.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TodoItem(
      id: doc.id,
      title: data['title'] ?? '(제목 없음)',
      completed: data['completed'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'completed': completed,
    };
  }
}
```

여기서 `id`는 Firestore 문서의 ID와 연동합니다. `fromDoc` 팩토리는 Firestore의 DocumentSnapshot을 받아 TodoItem 객체로 변환합니다. `toMap`은 객체를 Firestore에 저장할 수 있는 Map으로 변환합니다.

이제 전체 페이지 Widget 코드입니다:

```dart
class TodoAppPage extends StatefulWidget {
  @override
  _TodoAppPageState createState() => _TodoAppPageState();
}

class _TodoAppPageState extends State<TodoAppPage> {
  final _firestore = FirebaseFirestore.instance;
  List<TodoItem> _todos = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchTodos();  // 초기 목록 불러오기
  }

  Future<void> _fetchTodos() async {
    setState(() {
      _loading = true;
    });
    try {
      QuerySnapshot snapshot = await _firestore.collection('todos').get();
      final docs = snapshot.docs;
      _todos = docs.map((doc) => TodoItem.fromDoc(doc)).toList();
    } catch (e) {
      print('불러오기 오류: $e');
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _addTodo(String title) async {
    // Firestore에 새 문서 추가
    DocumentReference docRef = await _firestore.collection('todos').add({
      'title': title,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
    // 로컬 리스트에도 추가 (FireStore의 결과 활용)
    final newItem = TodoItem(id: docRef.id, title: title, completed: false);
    setState(() {
      _todos.add(newItem);
    });
  }

  Future<void> _updateTodoStatus(String id, bool completed) async {
    // Firestore 업데이트
    await _firestore.collection('todos').doc(id).update({
      'completed': completed
    });
    // 로컬 상태 업데이트
    setState(() {
      final idx = _todos.indexWhere((t) => t.id == id);
      if (idx != -1) {
        _todos[idx].completed = completed;
      }
    });
  }

  Future<void> _deleteTodo(String id) async {
    await _firestore.collection('todos').doc(id).delete();
    setState(() {
      _todos.removeWhere((t) => t.id == id);
    });
  }

  void _showAddTodoDialog() {
    String inputText = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('새 할 일 추가'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: '할 일 내용'),
            onChanged: (value) {
              inputText = value;
            },
            onSubmitted: (value) {
              Navigator.pop(context);
              if (value.trim().isNotEmpty) {
                _addTodo(value.trim());
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
                Navigator.pop(context);
                if (inputText.trim().isNotEmpty) {
                  _addTodo(inputText.trim());
                }
              },
            ),
          ],
        );
      }
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
            onPressed: _fetchTodos,
          ),
        ],
      ),
      body: _loading 
        ? Center(child: CircularProgressIndicator())
        : _todos.isEmpty 
          ? Center(child: Text('할 일이 없습니다.'))
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return Dismissible(
                  key: Key(todo.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteTodo(todo.id);
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (bool? value) {
                        if (value != null) {
                          _updateTodoStatus(todo.id, value);
                        }
                      },
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
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

코드가 좀 길지만 주요 부분을 해설하겠습니다:

* `_fetchTodos`: Firestore에서 "todos" 컬렉션의 모든 문서를 가져와 `_todos` 리스트를 채우는 함수입니다. 화면 표시 중 로딩 인디케이터를 보여주기 위해 `_loading` 상태를 true로 세팅하고, 완료 시 false로 바꿉니다. Firestore 쿼리 결과를 `TodoItem.fromDoc` 팩토리를 이용해 List<TodoItem>으로 변환했습니다.
* `_addTodo`: 새로운 할 일을 추가하는 함수입니다. Firestore에 `.add`로 문서를 추가하고, 리턴된 DocumentReference에서 새 문서의 ID를 얻습니다. 그 ID와 제목으로 TodoItem 객체를 만들어 로컬 리스트에 추가했습니다. 이렇게 하면, Firestore에서 다시 불러오지 않고도 즉각 UI에 반영됩니다.
* `_updateTodoStatus`: 체크박스 토글 시 호출. Firestore에서 해당 문서의 'completed' 필드를 업데이트하고, 로컬 `_todos` 리스트에서도 찾아서 값을 바꿉니다.
* `_deleteTodo`: 문서 삭제 및 로컬 리스트에서도 제거.

> 🗒️ **Note:** 여기서는 Firestore 작업이 끝나기 전에 UI를 미리 업데이트하는 낙관적 업데이트 방식을 썼습니다. 예를 들어 `_addTodo`에서 Firestore `.add` 완료 후 리스트에 추가하지만, 아주 느린 네트워크라면 사용자에게 추가된 것처럼 보이기까지 약간 지연이 있을 수 있습니다. 필요하면 `.add` 전에 임시 ID를 만들어 즉시 리스트에 추가하고, 나중에 실제 ID로 교체하는 식의 처리도 가능합니다. 그러나 예제에서는 단순화를 위해 순서를 맞췄습니다.

* `_showAddTodoDialog`: 새로운 할 일의 제목을 입력받기 위한 AlertDialog를 띄웁니다. `TextField`에서 onSubmitted나 추가 버튼 클릭 시에 `_addTodo`를 호출합니다. 빈 입력은 무시합니다.
* `build` 메서드:

  * AppBar에는 새로고침 버튼을 달아 `_fetchTodos`를 수동 갱신할 수 있게 했습니다.
  * body 부분: `_loading`일 때는 로딩 스피너, `_todos` 리스트가 비어있으면 안내 텍스트, 아니면 ListView로 목록을 출력합니다.
  * ListView\.builder에서 각 아이템을 `Dismissible`로 감쌌습니다. `Dismissible`은 스와이프해서 삭제 기능을 구현하기 위해 사용했습니다. `key`로 고유 id를 주고, `onDismissed`에서 `_deleteTodo`를 호출합니다. background에 빨간 삭제 아이콘을 우측에 배치해 UX를 개선했습니다.
  * 각 아이템의 ListTile은 Checkbox와 Text로 구성했습니다. Checkbox의 onChanged에서 `_updateTodoStatus`를 호출합니다. 제목 Text에는 completed일 때 취소선 스타일을 적용했습니다.

FloatingActionButton을 누르면 `_showAddTodoDialog`로 다이얼로그가 뜨고, 할 일을 입력 및 추가할 수 있습니다.

이제 이 TodoAppPage 위젯을 main.dart의 home으로 지정하거나, MyApp의 routes에 연결하면 앱이 구동됩니다. Firestore와 연결되어 있으므로, 다른 기기에서 동일한 Firebase 프로젝트의 앱을 실행하면 실시간으로는 아니어도 (우리는 스트림 안 씀) 새로고침 시 서로 데이터가 공유됨을 확인할 수 있습니다.

**실행 & 테스트:** 앱을 실행하여 할 일을 몇 개 추가하고, 체크박스로 완료 표시, 스와이프로 삭제 등을 테스트해보세요. Firebase 콘솔의 Firestore 데이터베이스 화면을 열어 보면 'todos' 컬렉션에 문서들이 생성되고 필드들이 바뀌는 것을 볼 수 있습니다.

> ⚠️ **주의:** Firestore의 보안 규칙 기본값은 인증 없이 쓰기를 막습니다. 테스트를 위해 Firebase 콘솔 > Firestore > Rules에서 임시로 규칙을 아래처럼 바꿔주세요 (배포용 앱에는 보안 설정을 해야 합니다):
>
> ```
> rules_version = '2';
> service cloud.firestore {
>   match /databases/{database}/documents {
>     match /{document=**} {
>       allow read, write: if true;
>     }
>   }
> }
> ```
>
> 이렇게 하면 인증 상관없이 모든 읽기/쓰기가 허용됩니다 (개발용으로만).

### 마무리

우리가 만든 할 일 앱은 매우 기본적인 형태지만, 이 과정에서 Flutter의 **위젯 구성**, **상태 관리(setState)**, **외부 패키지 활용(http, firebase 등)**, **Firebase 백엔드 연동** 등의 흐름을 모두 경험했습니다.

실제 현업 앱 개발은 이보다 훨씬 크고 복잡하지만, 기본 원리는 동일합니다. **UI는 위젯 트리**로 선언하고, **상태 변화에 따라 UI를 갱신**하며, **네트워크나 DB 등의 비동기 작업은 Future/Stream과 패키지로 처리**합니다. 규모가 커지면 코드를 분리하고 아키텍처를 개선해야 하지만, 시작은 언제나 **스몰 앱**을 만들어 보는 것이죠.

이 앱을 확장해볼 아이디어로:

* Firebase Authentication을 붙여 사용자별 할 일 목록 관리 (각 유저의 컬렉션으로 구분)
* 할 일에 기한(Date) 필드를 추가하고, 일정 시간에 알림 보내기 (로컬 notifications 패키지 사용)
* 완료한 할 일 숨기기/보이기 필터 옵션, UI 개선 등

이런 것들을 추가해볼 수 있습니다. 공부는 끝이 없지만, 여기까지 따라오신 것만으로도 Flutter 입문의 중요한 관문은 통과하신 겁니다!

---

## 부록: Flutter 개발 팁과 자주 겪는 이슈

마지막으로, Flutter로 개발하면서 유용한 팁과 흔히 접하는 문제들의 해결 방법을 모아보았습니다.

* **Hot Reload vs Hot Restart:** Flutter 개발의 강점인 Hot Reload는 코드 변경 시 상태를 유지한 채 UI만 갱신해줍니다. 하지만 가끔 UI가 꼬이거나, 상태 초기화가 필요하거나, 혹은 코드 수정이 메모리에 반영 안 되는 경우가 있습니다. 그럴 땐 Hot Restart (또는 완전 Restart)를 하세요. 특히 외부 패키지를 추가했을 때는 Hot Reload로는 인식이 안 되니 Restart가 필요합니다.

* **상태가 꼬이는 문제:** StatefulWidget을 다루다 보면, 상태 유지 범위를 헷갈려 엉뚱한 위젯에 상태가 남아 있는 경우가 있습니다. 예를 들어 ListView 안에 Stateful 위젯이 있는 경우, 스크롤 시 재사용되면서 상태가 공유되는 문제가 있을 수 있습니다. 이는 `Key`를 적절히 부여하면 해결됩니다. Flutter에서 Widget의 identity를 결정하는 Key를 잘 활용하는 습관을 가지세요 (특히 리스트 아이템의 Dismissible이나 AnimatedList 등에서 중요).

* **폰트 깨짐 / 한글 밑줄 문제:** Android Studio로 Flutter 코드를 작성할 때, 한글 문자열에 밑줄이 보이거나 오타로 인식되는 경우가 있었습니다. 이는 IDE의 맞춤법 검사 기능 때문입니다. Settings > Editor > Inspections 에서 Typo 관련 옵션을 끄면 해결됩니다. (최신 버전에서는 개선되었을 수도 있습니다.)

* **이미지 및 에셋 불러오기:** Flutter에서 이미지 넣을 때 pubspec.yaml에 assets 항목을 등록해야 합니다. 잊지 말고 `flutter pub get` 한 번 해주고, 코드에서 `AssetImage('assets/...')` 또는 `Image.asset('assets/...')`로 불러옵니다. 간혹 경로 오타나, pubspec 들여쓰기 문제로 이미지가 안 뜨는 경우가 있으니 주의하세요.

* **패키지 버전 충돌:** 외부 패키지를 여러 개 쓰다 보면 의존성 충돌이 날 수 있습니다. pubspec.yaml에 버전을 지정하면 Flutter가 가능한 호환되는 버전으로 조정하지만, 간혹 해결 못 하는 경우 수동 조정이 필요합니다. 에러 메시지를 잘 읽고, incompatible version 관련이면 특정 패키지 버전을 올리거나 내려서 맞춰보세요. 그래도 안 되면 GitHub 이슈나 커뮤니티를 검색해보는 것이 도움이 됩니다.

* **플랫폼별 차이:** iOS 시뮬레이터에서는 Firebase가 작동 안 한다거나, Android 에뮬레이터에서 한글 입력 이슈가 있다거나 하는 플랫폼 별 문제들도 있습니다. 일반적으로 패키지 문서에 플랫폼별 설정이 나와 있으니 꼼꼼히 확인하세요. 예를 들어, `google_maps_flutter` 쓰려면 iOS Info.plist에 API키 설정이 필요하고, AndroidManifest에도 meta-data 추가해야 합니다 등.

* **디버깅 도움 도구:** Flutter 개발 중 UI 레이아웃을 볼 때 **Flutter Inspector**(DevTools)를 사용하면 위젯 트리를 시각화하고 패딩 마진 등을 살펴볼 수 있어 좋습니다. 또한 Android Studio/VSCode의 **Breakpoint 디버깅**도 잘 동작하므로 로직 문제를 추적할 때 활용하세요. 더 나아가 Performance Overlay나 Dart DevTools의 Timeline 등을 보면 앱 성능 튜닝에도 도움이 됩니다.

* **빌드 문제:** "Gradle version incompatible" 또는 CocoaPods 관련 에러 등 빌드 단계에서 자주 만나는 문제들이 있습니다. Flutter는 자체 tooling이 좋아서 `flutter doctor`를 보면 친절히 원인을 알려주곤 합니다. Gradle 버전 문제는 android/gradle-wrapper.properties에서 버전을 올리거나, build.gradle에서 compileSdkVersion 등을 환경에 맞게 고치는 것으로 해결되고, iOS의 Pod 문제는 `pod repo update`나 `arch -x86_64 pod install` (M1 Mac) 등의 명령으로 해결되기도 합니다. 한글로 검색해도 많은 해결 사례가 공유되어 있으니, 당황하지 말고 천천히 따라 하면 됩니다.

* **커뮤니티와 자료:** 공식 문서([https://docs.flutter.dev](https://docs.flutter.dev)), Flutter Codelabs, 유튜브 강좌, 인프런 강좌 등 자료가 풍부합니다. 영어 자료가 더 많지만, 국내 개발자 커뮤니티 (OKKY, DevKor 등)나 오픈 카톡방, 스택오버플로 등에서도 정보를 얻을 수 있습니다. 막히면 적극적으로 검색해보고 질문해보세요.

마지막 팁으로: **Flutter는 계속 진화**하고 있습니다. 예를 들어 Flutter 3에서는 Windows/Linux 데스크톱 지원이 안정화되고, Flutter 3.7에서는 Material 3 디자인 지원, 새로운 라이브러리 등이 추가됐습니다. 또한 Dart 언어도 버전업되며 새로운 문법이 생길 수 있습니다. **항상 최신 트렌드**를 살피고 버전에 맞는 자료를 참고하세요. (공식 release 노트와 Medium 글 등을 구독 추천)

이상으로 Flutter 입문 교재를 마칩니다. 고생 많으셨습니다! 작은 앱이라도 직접 만들어본 경험은 큰 자산이 됩니다. 이 튜토리얼을 시작으로 더욱 멋진 Flutter 앱들을 만들어보길 바랍니다. **행복한 코딩 되세요!** 🎉

---

**참고 자료:**

* Flutter 공식 문서 - [스타트 가이드](https://docs.flutter.dev/get-started/install), [위젯 카탈로그](https://docs.flutter.dev/development/ui/widgets)
* Medium Flutter Korea - John님 글 "Flutter 코드랩 가이드라인" 등
* 코딩애플 Flutter 강좌 자료 - 개발환경 구축 팁
* Flutter/Firebase Codelab - Firebase 연동 튜토리얼
* 기타 블로그 및 인프런 강의 참고 등. (본문 각주 참고)


---
