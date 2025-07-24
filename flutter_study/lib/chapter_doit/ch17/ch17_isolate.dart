// import 'dart:async';
// import 'dart:isolate';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// /// Isolate에서 실행될 함수
// void myIsolate(SendPort mainSendPort) {
//   final isolateReceivePort = ReceivePort();

//   // 메인에게 이 Isolate의 SendPort를 알려줌
//   mainSendPort.send({'port': isolateReceivePort.sendPort});

//   isolateReceivePort.listen((message) {
//     if (message['msg'] != 'bye') {
//       int count = message['msg'];
//       int squared = count * count;
//       // 계산 결과를 메인에게 전달
//       mainSendPort.send({'msg': '[$count * $count = $squared]'});
//     } else {
//       // Isolate 종료
//       isolateReceivePort.close();
//     }
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<String> results = [];
//   SendPort? isolateSendPort;

//   /// 버튼 눌렀을 때 실행되는 함수
//   void onPress() async {
//     final mainReceivePort = ReceivePort();

//     // Isolate 생성
//     await Isolate.spawn(myIsolate, mainReceivePort.sendPort);

//     // 메인에서 받는 데이터 처리
//     mainReceivePort.listen((message) {
//       if (message['port'] != null) {
//         isolateSendPort = message['port'];

//         // Isolate 준비되면 타이머 시작
//         startSendingMessages();
//       } else if (message['msg'] != null) {
//         setState(() {
//           results.add(message['msg'].toString());
//         });
//       }
//     });
//   }

//   void startSendingMessages() {
//     int count = 0;
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       count++;
//       if (count <= 5) {
//         isolateSendPort?.send({'msg': count});
//       } else {
//         isolateSendPort?.send({'msg': 'bye'});
//         timer.cancel(); // 타이머 종료
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Isolate Test')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: onPress,
//                 child: Text('Start Isolate Task'),
//               ),
//               SizedBox(height: 20),
//               Text('Results:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: results.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(results[index]),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// 백그라운드에서 실행할 함수 (compute의 첫 번째 인자)
/// 반드시 최상위 함수여야 함!
List<String> heavyWork(int count) {
  List<String> results = [];
  for (int i = 1; i <= count; i++) {
    results.add('$i * $i = ${i * i}');
  }
  return results;
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> logs = [];
  bool isLoading = false;

  void startComputeTask() async {
    setState(() {
      isLoading = true;
      logs.clear();
    });

    // compute 함수 호출 (백그라운드로 heavyWork 실행)
    List<String> result = await compute(heavyWork, 5);

    setState(() {
      logs = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('compute() Example')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: isLoading ? null : startComputeTask,
              child: Text('Start compute()'),
            ),
            if (isLoading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(logs[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
