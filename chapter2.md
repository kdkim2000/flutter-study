# 2장: Dart 언어 기초와 실습

---

## 2.1 Dart란?

- **Dart**는 Flutter의 공식 언어입니다.
- Google이 만든 객체지향 언어로,  
  Java, JavaScript, C# 등과 문법이 비슷해 적응이 쉽습니다.
- **AOT 컴파일(빠른 실행) + JIT(Hot Reload)**,  
  둘 다 지원합니다.

---

## 2.2 Dart와 Java/JavaScript 간단 비교

| 특징        | Dart                      | Java           | JavaScript    |
|:-----------:|:------------------------:|:--------------:|:-------------:|
| 타입        | 명시적 & 타입추론 지원    | 명시적         | 동적          |
| 실행        | AOT/JIT(Hot Reload)       | JVM            | 브라우저/Node |
| 클래스      | 지원(상속, mixin)         | 지원           | ES6 이후 지원 |
| 람다        | 지원                      | 람다           | 화살표함수    |
| 널(null)    | null safety(옵션)         | null           | undefined 등  |

---

## 2.3 Dart 기초 문법

### 2.3.1 변수와 타입

```dart
// 변수 선언
int age = 30;
double height = 178.5;
String name = '홍길동';
bool isStudent = true;

// 타입 추론 (var, final, const)
var city = 'Seoul';      // 타입 자동 추론 → String
final country = 'Korea'; // 값 변경 불가(런타임 상수)
const pi = 3.14;         // 값 변경 불가(컴파일 상수)
````

> **TIP:**
>
> * `final`: 선언 후 값 변경 불가, 하지만 런타임에 결정 가능
> * `const`: 컴파일 시점에 고정(불변 객체)

---

### 2.3.2 기본 연산

```dart
int x = 7;
int y = 3;
print(x + y); // 10
print(x / y); // 2.333...
print(x ~/ y); // 2 (정수 나누기)
print(x % y); // 1 (나머지)
```

---

### 2.3.3 조건문

```dart
if (age >= 20) {
  print('성인입니다');
} else if (age >= 17) {
  print('고등학생입니다');
} else {
  print('청소년/어린이입니다');
}
```

---

### 2.3.4 반복문

```dart
// for
for (int i = 0; i < 5; i++) {
  print('i: $i');
}

// while
int n = 3;
while (n > 0) {
  print(n);
  n--;
}
```

---

### 2.3.5 함수

```dart
// 함수 선언
int add(int a, int b) {
  return a + b;
}

// 화살표 함수(한 줄)
int square(int x) => x * x;

// 함수 호출
var sum = add(3, 5); // 8
var s = square(4);   // 16
```

* **기본값/옵셔널 파라미터**:

```dart
void greet(String name, {String title = '님'}) {
  print('안녕하세요, $name$title');
}

greet('홍길동');          // 안녕하세요, 홍길동님
greet('코드', title: '선생'); // 안녕하세요, 코드선생
```

---

### 2.3.6 컬렉션 (List, Set, Map)

```dart
// 리스트(List)
List<String> fruits = ['사과', '바나나', '오렌지'];
fruits.add('포도');
print(fruits[0]); // 사과

// 셋(Set, 중복 없음)
Set<int> nums = {1, 2, 3, 2};
print(nums); // {1, 2, 3}

// 맵(Map, JS의 Object와 유사)
Map<String, int> scores = {'철수': 95, '영희': 88};
print(scores['철수']); // 95

// 컬렉션 for문
for (var fruit in fruits) {
  print(fruit);
}
```

---

### 2.3.7 클래스 & 객체

```dart
class Person {
  String name;
  int age;

  // 생성자
  Person(this.name, this.age);

  void sayHello() {
    print('안녕하세요, $name입니다. ($age세)');
  }
}

// 사용
var p1 = Person('홍길동', 23);
p1.sayHello(); // 안녕하세요, 홍길동입니다. (23세)
```

---

### 2.3.8 null safety (널 안정성)

Dart는 null 안전(null safety)을 지원합니다.

```dart
String? nickname;  // ?를 붙이면 null 허용
nickname = null;
nickname = "홍길동";
```

* null 값을 조심해야 할 때 `?`, `??`, `!` 활용

```dart
print(nickname ?? "익명"); // nickname이 null이면 "익명" 출력
```

---

## 2.4 실습: DartPad에서 직접 실행해보기

* **[DartPad](https://dartpad.dev/)**
  → 온라인에서 Dart 코드를 바로 실행!

**실습 미션 1. 내 정보를 출력하는 함수 만들기**

```dart
void printMyInfo(String name, int age) {
  print('이름: $name');
  print('나이: $age');
}

void main() {
  printMyInfo('홍길동', 27);
}
```

**실습 미션 2. 리스트의 평균 구하기**

```dart
void main() {
  List<int> scores = [70, 80, 90, 100];
  double avg = scores.reduce((a, b) => a + b) / scores.length;
  print('평균: $avg');
}
```

---

## 2.5 Java/JavaScript 개발자에게 Dart가 쉬운 이유

* 세미콜론(;) 사용, 클래스 문법이 익숙
* 변수 타입, 함수 정의, 객체지향 등 거의 비슷
* 주요 차이점: null safety, mixin, Future(비동기)

---

## 2.6 자주 묻는 질문(FAQ)

* **Q: var, final, const 차이?**

  * var: 타입 추론 변수, 값 변경 O
  * final: 값 한 번만 할당(런타임 상수), 값 변경 X
  * const: 컴파일 타임 상수, 값 변경 X

* **Q: 함수 내 함수(익명 함수) 가능?**

  * 가능. JS의 화살표 함수와 유사

---

## 2.7 추천 참고자료

* [Dart 공식 문서](https://dart.dev/guides)
* [DartPad (온라인 실습)](https://dartpad.dev/)
* [Flutter 문서의 Dart 소개](https://docs.flutter.dev/get-started/codelab)

---

## 2장 마무리

이제 Flutter 코드를 이해할 수 있는 Dart 언어 기초를 익혔습니다!
다음 장에서는 Flutter 앱 구조와 실제 화면 구성에 대해 배워봅니다.

---
