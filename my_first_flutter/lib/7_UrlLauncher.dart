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