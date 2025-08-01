# Doit 깡샘의 플러터&다트 프로그래밍

이 문서는 Doit 깡샘의 플러터&다트 프로그래밍' 강의에서 배운 내용을 정리한 요약본입니다. Flutter는 구글이 만든 오픈소스 프레임워크로, 하나의 코드로 안드로이드와 iOS 앱을 동시에 개발할 수 있습니다. 이 문서는 Flutter 입문자들이 각 챕터에서 어떤 개념을 배우고 어떤 식으로 실제 앱 개발에 적용할 수 있는지를 한눈에 파악할 수 있도록 구성되어 있습니다.

각 장에서는 Flutter 개발의 기초부터 고급 기능까지 단계적으로 익힐 수 있으며, 실습 위주의 강의 내용을 간단한 설명과 함께 정리하였습니다. 코드를 직접 작성해보며 이해하는 것이 가장 중요하므로, 설명만 읽기보다는 꼭 실습과 함께 학습하는 것이 좋습니다.

---

## CH10. 화면 구성과 레이아웃

앱을 만들기 위해선 화면에 보여줄 구성요소들을 어떻게 배치할지 정하는 것이 매우 중요합니다. Flutter에서는 모든 것이 위젯(widget)으로 표현되며, 이 위젯들을 어떻게 배치하느냐에 따라 앱의 UI가 달라집니다.

* **Row / Column**: 여러 위젯을 가로 또는 세로 방향으로 정렬할 수 있습니다. 예를 들어 버튼을 한 줄에 두 개 배치하려면 Row를, 세로로 쌓으려면 Column을 씁니다.
* **Stack / Positioned / Align**: 위젯들을 겹쳐서 배치하거나 원하는 위치에 정렬할 때 사용합니다. 배경 이미지 위에 글씨를 얹는 UI 같은 경우 유용합니다.
* **Expanded / Spacer**: 공간을 비율에 따라 나누거나, 빈 공간을 차지하도록 배치할 수 있습니다. 반응형 디자인 구현에 매우 유용합니다.

👉 다양한 레이아웃 위젯을 자유자재로 다룰 수 있어야 앱의 화면 구성이 자연스럽고 보기 좋게 만들어집니다.

---

## CH11. 사용자 입력 처리

사용자와의 상호작용은 앱에서 중요한 부분입니다. 사용자가 이름, 나이 등을 입력하거나 항목을 선택할 수 있도록 입력 위젯을 사용합니다.

* **TextField / TextFormField**: 글자를 입력하는 필드로, 로그인 아이디나 메모 입력 등에 사용됩니다.
* **Checkbox / Switch**: 항목을 선택하거나 켜고 끌 수 있도록 해줍니다.
* **Form / Validator**: 여러 입력 필드를 모아서 유효성 검사(validation)를 적용할 수 있습니다. 예: 비밀번호 6자리 이상 확인 등

👉 사용자로부터 데이터를 입력받고, 그 값을 처리하는 기초를 배울 수 있습니다.

---

## CH12. 스크롤과 리스트 뷰

많은 데이터를 한 화면에 다 보여주기 어렵기 때문에, 스크롤 가능한 리스트 UI를 구성하는 방법을 배웁니다.

* **ListView**: 가장 기본적인 스크롤 리스트. 뉴스 목록이나 채팅 메시지에 자주 사용됩니다.
* **GridView**: 가로 세로 격자 형태로 항목을 배치. 사진 갤러리 같은 UI 구성에 활용됩니다.
* **PageView**: 페이지를 좌우로 넘기며 볼 수 있는 구성. 앱 튜토리얼 화면에서 많이 볼 수 있습니다.
* **Dialog / BottomSheet**: 알림창, 하단 팝업 등을 통해 추가 정보를 보여줍니다.

👉 리스트 형태의 UI는 실제 앱에서 매우 자주 사용되므로 꼭 익혀야 합니다.

---

## CH13. 앱의 기본 구조 설계

Flutter 앱을 실행하면 가장 먼저 앱의 뼈대를 구성하는 구조를 정의하게 됩니다. 이 챕터에서는 앱의 전체 틀을 만드는 위젯들을 배웁니다.

* **MaterialApp / Scaffold**: 전체 앱을 감싸는 기본 구조이며, 화면 전체를 관리합니다.
* **AppBar / Drawer / BottomNavigationBar**: 화면 상단 바, 왼쪽 메뉴, 하단 탭 바 등을 만들 수 있습니다.

👉 실전 앱을 만들 때 필수적인 구조를 구성하는 단계입니다.

---

## CH14. 화면 전환과 라우팅

앱에서는 여러 화면 간에 이동이 필요합니다. 예를 들어 로그인 후 메인 화면으로 넘어가거나, 리스트에서 상세 페이지로 이동할 수 있습니다.

* **Navigator.push / pop**: 다른 화면으로 이동하거나, 뒤로 돌아가는 기능입니다.
* **arguments 전달**: 이동하면서 데이터도 함께 전달할 수 있습니다. 예: 선택한 상품 정보를 상세 페이지로 넘기기

👉 다양한 화면 전환을 자연스럽게 구현할 수 있습니다.

---

## CH15. API와 JSON 데이터 처리

Flutter 앱이 외부 서버와 데이터를 주고받을 수 있도록 HTTP 통신을 처리하는 방법과 JSON 데이터를 다루는 법을 배웁니다.

* **http / dio**: 서버에 요청을 보내고 응답을 받아오는 라이브러리입니다. dio는 기능이 더 많아 고급 앱 개발에 적합합니다.
* **JSON**: 데이터를 key와 value로 구성된 형식으로 주고받는 표준 포맷입니다.

👉 외부 데이터와 연동되는 앱을 만들기 위해 꼭 필요한 기술입니다.

---

## CH16. 비동기 처리 이해

서버에서 데이터를 받아오거나 오래 걸리는 작업은 기다리는 동안 다른 작업을 동시에 할 수 있어야 앱이 느려지지 않습니다. 이를 위해 비동기 처리가 필요합니다.

* **Future / async / await**: 일정 시간이 걸리는 작업을 순서대로 기다리며 처리합니다.
* **Stream**: 실시간으로 변화하는 데이터(예: 센서 값, 채팅 메시지)를 처리할 수 있습니다.

👉 앱이 멈추지 않고 자연스럽게 작동하도록 만드는 데 꼭 필요한 개념입니다.

---

## CH17. 병렬 작업 처리

이미지 편집이나 파일 다운로드처럼 시간이 오래 걸리는 작업은 UI가 멈추지 않도록 백그라운드에서 실행해야 합니다.

* **Isolate / compute()**: 메인 스레드에서 분리해서 무거운 작업을 따로 실행할 수 있게 합니다.

👉 성능 좋은 앱을 만들기 위해 필요한 기법입니다.

---

## CH18. 상태 관리의 기초

앱에서는 버튼 클릭, 스크롤, 입력 등으로 화면 상태가 계속 바뀝니다. 이러한 상태를 관리하는 기본적인 방법을 배웁니다.

* **setState**: 상태가 바뀌었을 때 화면을 다시 그려줍니다.

👉 간단한 앱에서는 이 방식만으로도 충분히 다양한 기능을 구현할 수 있습니다.

---

## CH19. Provider를 이용한 상태 관리

앱이 커질수록 상태를 여러 곳에서 공유해야 하므로, 전역 상태 관리가 필요합니다.

* **Provider**: 데이터를 앱 전체에서 공유하고, 변화가 생기면 자동으로 화면이 업데이트되도록 도와주는 라이브러리입니다.

👉 앱 구조를 깔끔하게 유지할 수 있어 중급 앱 개발에 필수입니다.

---

## CH20. BLoC과 Cubit 패턴

상태 관리를 체계적으로 하기 위해 더 구조적인 방식을 배우는 챕터입니다. 이벤트가 발생하면 새로운 상태를 만들어내는 패턴입니다.

* **Bloc / Cubit**: 사용자 입력 같은 이벤트에 따라 상태를 바꾸고, 이를 UI에 반영합니다.

👉 대규모 프로젝트에서 유지보수하기 좋은 구조를 설계할 수 있습니다.

---

## CH21. GetX로 간편한 상태 관리

GetX는 코드가 간결하고 빠르게 앱을 만들 수 있는 상태 관리 도구입니다.

* **Rx 변수**: 변수 값이 바뀌면 화면도 자동으로 바뀝니다. 따로 새로 고침을 하지 않아도 됩니다.

👉 빠르고 간단한 앱 제작에 유용한 도구입니다.

---

## CH22. 플랫폼 기능 연결하기

Flutter가 기본적으로 제공하지 않는 기능을 Android나 iOS에 있는 코드와 연결해서 사용할 수 있도록 해줍니다.

* **MethodChannel**: Flutter와 네이티브(Android/iOS) 코드가 데이터를 주고받을 수 있는 통로입니다.

👉 스마트폰 고유 기능을 활용한 고급 앱을 만들 수 있게 해줍니다.

---

## CH23. 디바이스 기능 활용하기

스마트폰의 기본 기능들을 앱 안에서 사용할 수 있도록 하는 방법을 배웁니다.

* **geolocator**: 현재 위치 정보를 가져옵니다.
* **image\_picker**: 카메라로 사진을 찍거나, 앨범에서 사진을 선택합니다.
* **shared\_preferences**: 간단한 설정값(예: 자동 로그인)을 저장합니다.
* **sqflite**: SQLite 기반 데이터베이스로, 정보를 앱 안에 저장할 수 있습니다.

👉 위치 기반 앱, 메모 앱, 카메라 앱 등을 만들 때 필요한 기술입니다.

---

## CH24. Firebase를 이용한 로그인 기능

Google에서 제공하는 Firebase를 활용해 로그인 기능을 만들 수 있습니다.

* **Firebase Authentication**: 이메일/비밀번호로 회원가입하고 로그인할 수 있는 기능입니다.

👉 인증 기능은 대부분의 앱에서 필수적인 요소입니다.

---

## CH25. 실시간 데이터와 알림 받기

Firebase를 이용해 클라우드에 데이터를 저장하고 실시간으로 다른 기기와 동기화하거나, 알림을 보내는 기능을 구현합니다.

* **Firestore**: 실시간 데이터베이스로, 데이터를 저장하고 앱에서 바로 보여줄 수 있습니다.
* **Firebase Messaging**: 푸시 알림을 받을 수 있게 도와줍니다.

👉 실시간 채팅, 알림 기능이 있는 앱에 반드시 필요한 기술입니다.

---

📁 각 챕터의 실습 코드는 `/chapter_doit/chXX/` 폴더에 저장되어 있습니다. 예제 코드를 열어보고 직접 따라 해 보면서 이해하는 것이 가장 좋은 학습 방법입니다.
