import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(UrlLauncherDemo());

class UrlLauncherDemo extends StatelessWidget {
  const UrlLauncherDemo({super.key});

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
